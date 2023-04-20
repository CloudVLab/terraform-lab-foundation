# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform
#
module "mesh_api" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Service to enable
  api_service_name = "mesh.googleapis.com"  
}

module "compute_api" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Service to enable
  api_service_name = "compute.googleapis.com"  
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project
data "google_project" "project" {
  project_id = var.gcp_project_id
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_default_service_account
data "google_compute_default_service_account" "default" {
  project = var.gcp_project_id
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "gke" {
  provider = google-beta
  project  = var.gcp_project_id
  name = var.gke_cluster_name
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

    # hard coded node count due to limits of "gcpd" variant
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

  depends_on = [ module.mesh_api ]
}

# Compute Engine default service account 
resource "google_project_iam_member" "compute-owner-bind" {
  project = var.gcp_project_id
  role    = "roles/owner"
  member  = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}


resource "google_service_account" "service_account" {
  account_id   = "compute-startup"
  display_name = "SA for lab startup"
}

resource "google_service_account_iam_member" "owner_sa_role_bind" {
  service_account_id = data.google_compute_default_service_account.default.name
  role               = "roles/owner"
  member             = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_compute_instance" "asm_installer" {
  name         = "asm-installer"
  machine_type = "e2-standard-2"
  zone         = var.gcp_zone
  tags         = ["http", "https"]
  
  metadata_startup_script = file("${path.module}/install.sh")

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  metadata = {
    gcp_username = "${var.gcp_username}"
    gcp_zone = "${var.gcp_zone}"
    gcp_region = "${var.gcp_region}"
    gke_cluster_name = "${var.gke_cluster_name}"
  }

  depends_on = [ google_service_account_iam_member.owner_sa_role_bind, google_container_cluster.gke ]
}

# resource "google_project_iam_binding" "binding" {
#   project = var.gcp_project_id
#   role    = "roles/iam.serviceAccountOpenIdTokenCreator"
#   members = ["user:${var.gcp_username}@qwiklabs.net"]
# }

# resource "google_project_iam_binding" "binding1" {
#   project = var.gcp_project_id
#   role    = "roles/iam.serviceAccountTokenCreator"
#   members = ["user:${var.gcp_username}@qwiklabs.net"]
# }

resource "google_project_iam_member" "compute-owner-bind1" {
  project = var.gcp_project_id
  role    = "roles/iam.serviceAccountOpenIdTokenCreator"
  member  = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "compute-owner-bind2" {
  project = var.gcp_project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}