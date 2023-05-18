#-----------------------------------------------------------------------------
# Data: Get the Google project values as an object 
#-----------------------------------------------------------------------------

data "google_project" "project" {
  project_id = var.gcp_project_id
}

#-----------------------------------------------------------------------------
# locals: Local variable definition 
#-----------------------------------------------------------------------------
locals {
  # Use the Google project object
  cloudbuild_sa = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
  compute_sa    = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}

#-----------------------------------------------------------------------------
# Module: IAM Service Account bind to a role
#-----------------------------------------------------------------------------
module "la_sa_role" {
  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/iam_sa_role/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region 
  gcp_zone       = var.gcp_zone 

  # Pass the service account as principle member - non authorative binding
  # container.admin - ASM management
  # iam.serviceAccountUser - View enabled services
  iam_sa_name  = local.cloudbuild_sa
  iam_sa_roles = ["roles/editor","roles/container.developer","roles/iam.serviceAccountUser"] 
  # iam_sa_roles = ["roles/container.admin"] 
}

module "la_api_batch" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/dev"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCE instance
  api_services = [ "mesh.googleapis.com", "compute.googleapis.com" ]
}

resource "google_container_cluster" "gke" {
  provider = google-beta
  project  = var.gcp_project_id
  name     = var.gke_cluster_name
  location = var.gcp_zone

  # Enable Workload Identity for cluster
  workload_identity_config {
    workload_pool = "${var.gcp_project_id}.svc.id.goog"
  }

  resource_labels = {
    "mesh_id"     = "proj-${data.google_project.project.number}"
  }

  node_pool {
    node_config {
      machine_type = "n1-standard-2"

      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
      ]

      labels = {
        environment = "dev",
        cluster     = "${var.gke_cluster_name}-main"
        mesh_id     = "proj-${data.google_project.project.number}"
      }

      # Enable Workload Identity for node pool
      workload_metadata_config {
        mode = "GKE_METADATA"
      }
    }

    initial_node_count = 2

    autoscaling {
      min_node_count = 2
      max_node_count = 2
    }

    management {
      auto_repair  = false
      auto_upgrade = false
    }
  }

  # https://cloud.google.com/kubernetes-engine-monitoring/
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  depends_on = [ module.la_api_batch ]
}

module "cloudbuild_script" {
  source = "terraform-google-modules/gcloud/google"
  version = "~> 3.0.1"
  platform = "linux"
  create_cmd_entrypoint = "chmod +x ${path.module}/scripts/install_asm.sh;${path.module}/scripts/install_asm.sh"
  # create_cmd_body = "${var.gcp_project_id} ${data.google_project.project.number} ${var.gcp_zone} ${var.gcp_username} ${var.gke_cluster_name} ${local.compute_sa}"
  create_cmd_body = "${var.gcp_project_id} ${data.google_project.project.number} ${var.gcp_zone} ${var.gcp_username} ${var.gke_cluster_name}"
  skip_download = false
  upgrade = false
  gcloud_sdk_version = "358.0.0"
  service_account_key_file = var.service_account_key_file

  # Await GKE Cluster Deployment 
  module_depends_on = [
    google_container_cluster.gke
  ]
}
