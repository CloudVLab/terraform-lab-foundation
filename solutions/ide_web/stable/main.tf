# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "dev_network" {
  name = "dev-network"
  description = "Developer network"
  auto_create_subnetworks = false
}

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "dev_subnet" {
  name          = "dev-subnetwork"
  ip_cidr_range = "10.128.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.dev_network.id
}

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "serverless-to-vpc-connector" {
  name    = "serverless-to-vpc-connector"
  network = google_compute_network.dev_network.name
  source_ranges = ["107.178.230.64/26", "35.199.224.0/19"]
  direction = "INGRESS"

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

  depends_on = [ google_compute_network.dev_network ]
}

resource "google_compute_firewall" "vpc-connector-to-serverless" {
  name    = "vpc-connector-to-serverless"
  network = google_compute_network.dev_network.name
  destination_ranges = ["107.178.230.64/26", "35.199.224.0/19"]
  direction = "EGRESS"

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

  depends_on = [ google_compute_network.dev_network ]
}


resource "google_compute_firewall" "vpc-connector-health-check" {
  name    = "vpc-connector-health-check"
  network = google_compute_network.dev_network.name
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16", "108.170.220.0/23"]
  direction = "INGRESS"

  # Enable INGRESS
  allow {
    protocol = "tcp"
    ports    = ["667"]
  }

  target_tags = ["vpc-connector"]

  depends_on = [ google_compute_network.dev_network ]
}


resource "google_compute_firewall" "vpc-connector-egress" {
  name    = "vpc-connector-egress"
  network = google_compute_network.dev_network.name
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

  depends_on = [ google_compute_network.dev_network ]
}



# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vpc_access_connector

# Enable the vpc access service
resource "google_project_service" "vpcaccess-api" {
  project = var.gcp_project_id
  service = "vpcaccess.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  # disable_dependent_services = true
}

resource "google_vpc_access_connector" "connector" {
  provider      = google-beta
  name          = "ideconn"
  region        = var.gcp_region
  network       = google_compute_network.dev_network.name
  ip_cidr_range = "10.8.0.0/28"

  # Note: valid options: f1-micro, e2-micro, e2-standard-4
  machine_type = var.vpcConnectorMachineType 

  depends_on = [
    google_project_service.vpcaccess-api, google_compute_network.dev_network
  ]
}


# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service
#
# Enable the Cloud Run service
resource "google_project_service" "run" {
  project = var.gcp_project_id
  service = "run.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  # disable_dependent_services = true
}


resource "google_cloud_run_service" "ide" {
  name     = "ide-service" 
  location = var.gcrRegion

  template {
    spec {
      containers {
        image = "gcr.io/qwiklabs-resources/ide-proxy:latest"
      }
      container_concurrency = 2
    }

    # Add support for vpc connector
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "3"
        "autoscaling.knative.dev/minScale" = "1"
        "run.googleapis.com/vpc-access-egress" = "all"
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }

  # Dependency - Cloud Run API enabled
  depends_on = [google_project_service.run, google_compute_instance.default]
}


resource "google_cloud_run_service" "browser" {
  name     = "browser-service"
  location = var.gcrRegion

  template {
    spec {
      containers {
        image = "gcr.io/qwiklabs-resources/web-proxy:latest"
      }
      container_concurrency = 2
    }

    # Add support for vpc connector
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "3"
        "autoscaling.knative.dev/minScale" = "1"
        "run.googleapis.com/vpc-access-egress" = "all"
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }

  # Dependency - Cloud Run API enabled
  depends_on = [google_project_service.run, google_compute_instance.default]
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "ide_noauth" {
  location    = google_cloud_run_service.ide.location
  project     = google_cloud_run_service.ide.project
  service     = google_cloud_run_service.ide.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

resource "google_cloud_run_service_iam_policy" "browser_noauth" {
  location    = google_cloud_run_service.browser.location
  project     = google_cloud_run_service.browser.project
  service     = google_cloud_run_service.browser.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_instance
data "google_compute_image" "image_family" {
  family  = var.gceMachineImage 
  project = "qwiklabs-resources"
}

# GCE:    Virtual Machine
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
#

# Module: Google Compute Engine
module "la_gce" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone
  gcp_username   = var.tfUsername

  # Customise the GCE instance
  gce_name            = var.tfResourceName
  gce_region          = var.gcp_region
  gce_zone            = var.gceInstanceZone
  gce_machine_type    = var.gceMachineType
  gce_tags            = var.gceInstanceTags 
  #gce_machine_image   = "debian-cloud/debian-10" 
  gce_machine_network = google_compute_subnetwork.dev_subnet.name
  gce_scopes          = ["cloud-platform"] 
  #gce_startup_script   = "${file("./scripts/lab-init")}"

  # Dependency - VPC Access connector 
  depends_on = [google_vpc_access_connector.connector]
}
