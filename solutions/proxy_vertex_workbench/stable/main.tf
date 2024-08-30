# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

# Network
resource "google_compute_network" "dev_network" {
  name                    = "dev-network"
  project                 = var.gcp_project_id
  description             = "Developer network"
  auto_create_subnetworks = false
}

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

# Subnet
resource "google_compute_subnetwork" "dev_subnet" {
  name          = "dev-subnetwork"
  ip_cidr_range = "10.128.0.0/16"
  region        = var.gcp_region
  network       = google_compute_network.dev_network.id
  project       = var.gcp_project_id
}

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall

# Firewall: Allow Serverless to VPC connector
resource "google_compute_firewall" "serverless-to-vpc-connector" {
  name          = "serverless-to-vpc-connector"
  network       = google_compute_network.dev_network.name
  project       = var.gcp_project_id
  source_ranges = ["107.178.230.64/26", "35.199.224.0/19"]
  direction     = "INGRESS"

  # Enable INGRESS
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["667"]
  }

  allow {
    protocol = "udp"
    ports    = ["665-666"]
  }

  # source_tags = ["web"]
  target_tags = ["vpc-connector"]

  depends_on = [google_compute_network.dev_network]
}

# Firewall: Allow VPC connector to Serverless
resource "google_compute_firewall" "vpc-connector-to-serverless" {
  name               = "vpc-connector-to-serverless"
  network            = google_compute_network.dev_network.name
  project            = var.gcp_project_id
  destination_ranges = ["107.178.230.64/26", "35.199.224.0/19"]
  direction          = "EGRESS"

  # Enable EGRESS
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["667"]
  }

  allow {
    protocol = "udp"
    ports    = ["665-666"]
  }

  target_tags = ["vpc-connector"]

  depends_on = [google_compute_network.dev_network]
}

# Firewall: Allow Healthcheck
resource "google_compute_firewall" "vpc-connector-health-check" {
  name          = "vpc-connector-health-check"
  network       = google_compute_network.dev_network.name
  project       = var.gcp_project_id
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16", "108.170.220.0/23"]
  direction     = "INGRESS"

  # Enable INGRESS
  allow {
    protocol = "tcp"
    ports    = ["667"]
  }

  target_tags = ["vpc-connector"]

  depends_on = [google_compute_network.dev_network]
}

# Firewall: Allow TCP/UDP/ICMP
resource "google_compute_firewall" "vpc-connector-egress" {
  name      = "vpc-connector-egress"
  network   = google_compute_network.dev_network.name
  project   = var.gcp_project_id
  direction = "INGRESS"

  # Enable INGRESS
  allow {
    protocol = "tcp"
  }
  allow {
    protocol = "udp"
  }
  allow {
    protocol = "icmp"
  }

  source_tags = ["vpc-connector"]


  depends_on = [google_compute_network.dev_network]
}

# Firewall: Allow SSH
resource "google_compute_firewall" "vm-ssh" {
  name          = "dev-network-allow-ssh"
  network       = google_compute_network.dev_network.name
  project       = var.gcp_project_id
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  # Enable INGRESS
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Vertex default tags: "deeplearning-vm" "notebook-instance"
  source_tags = ["deeplearning-vm", "notebook-instance"]

  depends_on = [google_compute_network.dev_network]
}


# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vpc_access_connector

# Enable the VPC access service
resource "google_project_service" "vpcaccess-api" {
  project = var.gcp_project_id
  service = "vpcaccess.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  # disable_dependent_services = true
}

## https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
## https://www.phillipsj.net/posts/random-things-with-terraform/
## ^[a-z][-a-z0-9]{0,23}[a-z0-9]$.
resource "random_string" "vpc-connector" {
  length  = 10
  special = false
  upper   = false
}

# Enable VPC connector
resource "google_vpc_access_connector" "connector" {
  ## Max 25 characters
  name          = "vpcconn-${random_string.vpc-connector.id}"
  provider      = google-beta
  project       = var.gcp_project_id
  region        = var.gcp_region
  network       = google_compute_network.dev_network.id
  ip_cidr_range = "10.8.0.0/28"

  # Note: valid options: f1-micro, e2-micro, e2-standard-4
  machine_type = var.vpcConnectorMachineType
  min_instances = 2
  max_instances = 3

  # https://github.com/google/exposure-notifications-server/issues/932
  # vpc_access_connector_max_throughput= 300

  depends_on = [
    google_project_service.vpcaccess-api, google_compute_network.dev_network
  ]
}

# Enable the notebooks service
resource "google_project_service" "notebooks-api" {
  project = var.gcp_project_id
  service = "notebooks.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  # disable_dependent_services = true
}


# Reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
#
resource "google_service_account" "service_account" {
  account_id   = "vertex-ai"
  display_name = "Vertex AI Service Account"
  project      = var.gcp_project_id
}


# Reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
#
# Authoritative Binding
## resource "google_project_iam_binding" "vertex_role_bind" {
##   #role    = "roles/viewer"
##   role    = "roles/editor"
##   project = var.gcp_project_id
##   members = [
##     "serviceAccount:vertex-ai@${var.gcp_project_id}.iam.gserviceaccount.com",
##   ]
##   depends_on = [google_service_account.service_account]
## }

# Non Authoritative Binding
resource "google_project_iam_member" "vertex_role_bind" {
  role    = "roles/editor"
  project = var.gcp_project_id
  member  = "serviceAccount:vertex-ai@${var.gcp_project_id}.iam.gserviceaccount.com"

  depends_on = [google_service_account.service_account]
}


# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/notebooks_instance
#

resource "google_notebooks_instance" "vertex_instance" {
  name = var.gceInstanceName
  # location   = var.gceInstanceZone
  location     = var.gcp_zone
  project      = var.gcp_project_id
  machine_type = var.gceMachineType
  tags         = var.gceInstanceTags

  #instance_owners = ["$var.username"]

  install_gpu_driver = false
  #  no_public_ip = true
  ## Set no_proxy_access = true to use SSH Port Forward
  no_proxy_access = true

  network = google_compute_network.dev_network.id
  subnet  = google_compute_subnetwork.dev_subnet.id

  labels = {
    host = "vertexai_notebook"
  }

  vm_image {
    project      = var.gceImageProject
    image_family = var.gceInstanceImage
  }

  # Startup-script
  post_startup_script = var.gcePostStartupScript

  depends_on = [google_project_service.notebooks-api, google_compute_subnetwork.dev_subnet]
  ## depends_on = [google_project_service.notebooks-api, google_compute_subnetwork.dev_subnet]
}

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service

# Enable the Cloud Run service
resource "google_project_service" "run" {
  project = var.gcp_project_id
  service = var.gcrGoogleService

  timeouts {
    create = "30m"
    update = "40m"
  }

  # disable_dependent_services = true
}

# Cloud Run: IDE
resource "google_cloud_run_service" "jupyter" {
  name     = var.gcrServiceName
  # location = var.gcrRegion
  location = var.gcp_region
  project  = var.gcp_project_id

  template {
    spec {
      containers {
        image = var.gcrImagePrimary
      }
      container_concurrency = 2
    }

    # Add support for vpc connector
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"        = "3"
        "autoscaling.knative.dev/minScale"        = "1"
        "run.googleapis.com/vpc-access-egress"    = "all"
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  # Dependency - Cloud Run API enabled
  depends_on = [google_project_service.run, google_notebooks_instance.vertex_instance]
}

# Cloud Run: IAM Policy
data "google_iam_policy" "noauth" {
  binding {
    role = var.gcrRolePermission
    members = [
      var.gcrMemberPermission,
    ]
  }
}

# Cloud Run: Workbench Policy
resource "google_cloud_run_service_iam_policy" "vertex_noauth" {
  location = google_cloud_run_service.jupyter.location
  project  = google_cloud_run_service.jupyter.project
  service  = google_cloud_run_service.jupyter.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
