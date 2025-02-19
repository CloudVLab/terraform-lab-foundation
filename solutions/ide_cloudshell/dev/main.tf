## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
## 
## # Network
## resource "google_compute_network" "dev_network" {
##   name = "dev-network"
##   description = "Developer network"
##   auto_create_subnetworks = false
## }
## 
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
## 
## # Subnet
## resource "google_compute_subnetwork" "dev_subnet" {
##   name                     = "dev-subnetwork"
##   ip_cidr_range            = "10.128.0.0/16"
##   region                   = var.gcp_region
##   network                  = google_compute_network.dev_network.id
##   private_ip_google_access = var.vpcPrivateGoogleAccess
## ##  log_config {
## ##    aggregation_interval = "INTERVAL_10_MIN"
## ##    flow_sampling        = 0.5
## ##    metadata             = "INCLUDE_ALL_METADATA"
## ##  }
## }
## 
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
## 
## # Firewall: Allow Serverless to VPC connector
## resource "google_compute_firewall" "serverless-to-vpc-connector" {
##   name    = "serverless-to-vpc-connector"
##   network = google_compute_network.dev_network.name
##   source_ranges = ["107.178.230.64/26", "35.199.224.0/19"]
##   direction = "INGRESS"
## 
##   # Enable INGRESS
##   allow {
##     protocol = "icmp"
##   }
##   allow {
##     protocol = "tcp"
##     ports    = ["667"]
##   }
## 
##   allow {
##     protocol = "udp"
##     ports    = ["665-666"]
##   }
## 
##   # source_tags = ["web"]
##   target_tags = ["vpc-connector"]
## 
##   depends_on = [ google_compute_network.dev_network ]
## }
## 
## # Firewall: Allow VPC connector to Serverless
## resource "google_compute_firewall" "vpc-connector-to-serverless" {
##   name    = "vpc-connector-to-serverless"
##   network = google_compute_network.dev_network.name
##   destination_ranges = ["107.178.230.64/26", "35.199.224.0/19"]
##   direction = "EGRESS"
## 
##   # Enable EGRESS
##   allow {
##     protocol = "icmp"
##   }
##   allow {
##     protocol = "tcp"
##     ports    = ["667"]
##   }
## 
##   allow {
##     protocol = "udp"
##     ports    = ["665-666"]
##   }
## 
##   target_tags = ["vpc-connector"]
## 
##   depends_on = [ google_compute_network.dev_network ]
## }
## 
## # Firewall: Allow Healthcheck
## resource "google_compute_firewall" "vpc-connector-health-check" {
##   name    = "vpc-connector-health-check"
##   network = google_compute_network.dev_network.name
##   source_ranges = ["130.211.0.0/22", "35.191.0.0/16", "108.170.220.0/23"]
##   direction = "INGRESS"
## 
##   # Enable INGRESS
##   allow {
##     protocol = "tcp"
##     ports    = ["667"]
##   }
## 
##   target_tags = ["vpc-connector"]
## 
##   depends_on = [ google_compute_network.dev_network ]
## }
## 
## # Firewall: Allow TCP/UDP/ICMP
## resource "google_compute_firewall" "vpc-connector-egress" {
##   name    = "vpc-connector-egress"
##   network = google_compute_network.dev_network.name
##   direction = "INGRESS"
## 
##   # Enable INGRESS
##   allow {
##     protocol = "tcp"
##   }
##   allow {
##     protocol = "udp"
##   }
##   allow {
##     protocol = "icmp"
##   }
## 
##   source_tags = ["vpc-connector"]
## 
##   depends_on = [ google_compute_network.dev_network ]
## }
## 
## # Firewall: Allow SSH
## ## resource "google_compute_firewall" "vm-ssh" {
## ##   name    = "vm-ssh"
## ##   network = google_compute_network.dev_network.name
## ##   direction = "INGRESS"
## ## 
## ##   # Enable INGRESS
## ##   allow {
## ##     protocol = "tcp"
## ##     ports    = ["22"]
## ##   }
## ## 
## ##   source_tags = ["lab-vm"]
## ## 
## ##   depends_on = [ google_compute_network.dev_network ]
## ## }
## 
## # IAP Tunnel: Allow IAP 
## resource "google_compute_firewall" "vm-iap" {
##   name    = "vm-iap"
##   network = google_compute_network.dev_network.name
##   source_ranges = ["35.235.240.0/20"]
##   direction = "INGRESS"
## 
##   # Enable INGRESS
##   allow {
##     protocol = "tcp"
##   }
## 
##   source_tags = ["lab-vm"]
## 
##   depends_on = [ google_compute_network.dev_network ]
## }
## 
## 
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vpc_access_connector
## 
## # Enable the VPC access service
## resource "google_project_service" "vpcaccess-api" {
##   project = var.gcp_project_id
##   service = "vpcaccess.googleapis.com"
## 
##   timeouts {
##     create = "30m"
##     update = "40m"
##   }
## 
##   # disable_dependent_services = true
## }
## 
## # Enable VPC connector
## resource "google_vpc_access_connector" "connector" {
##   provider      = google-beta
##   name          = "ideconn"
##   region        = var.gcp_region
##   network       = google_compute_network.dev_network.name
##   ip_cidr_range = "10.8.0.0/28"
## 
##   # Note: valid options: f1-micro, e2-micro, e2-standard-4
##   machine_type = var.vpcConnectorMachineType 
## 
##   depends_on = [
##     google_project_service.vpcaccess-api, google_compute_network.dev_network
##   ]
## }
## 
## 
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service
## 
## 
## # Enable the Cloud Run service
## resource "google_project_service" "run" {
##   project = var.gcp_project_id
##   service = "run.googleapis.com"
## 
##   timeouts {
##     create = "30m"
##     update = "40m"
##   }
## 
##   # disable_dependent_services = true
## }
## 
## # Cloud Run: IDE
## resource "google_cloud_run_service" "ide" {
##   name     = "ide-service" 
##   location = var.gcp_region
## 
##   template {
##     spec {
##       containers {
##         image = var.gcrImageIde
##       }
##       container_concurrency = 2
##     }
## 
##     # Add support for vpc connector
##     metadata {
##       annotations = {
##         "autoscaling.knative.dev/maxScale" = "3"
##         "autoscaling.knative.dev/minScale" = "1"
##         "run.googleapis.com/vpc-access-egress" = "all"
##         "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
##       }
##     }
##   }
## 
##   traffic {
##     percent = 100
##     latest_revision = true
##   }
## 
##   # Dependency - Cloud Run API enabled
##   depends_on = [google_project_service.run, google_compute_instance.default]
## }
## 
## 
## # Cloud Run: Browser 
## resource "google_cloud_run_service" "browser" {
##   name     = "browser-service"
##   location = var.gcp_region
## 
##   template {
##     spec {
##       containers {
##         image = var.gcrImageBrowser
##       }
##       container_concurrency = 2
##     }
## 
##     # Add support for vpc connector
##     metadata {
##       annotations = {
##         "autoscaling.knative.dev/maxScale" = "3"
##         "autoscaling.knative.dev/minScale" = "1"
##         "run.googleapis.com/vpc-access-egress" = "all"
##         "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
##       }
##     }
##   }
## 
##   traffic {
##     percent = 100
##     latest_revision = true
##   }
## 
##   # Dependency - Cloud Run API enabled
##   depends_on = [google_project_service.run, google_compute_instance.default]
## }
## 
## # Cloud Run: IAM Policy
## data "google_iam_policy" "noauth" {
##   binding {
##     role = "roles/run.invoker"
##     members = [
##       "allUsers",
##     ]
##   }
## }
## 
## # Cloud Run: IDE Policy
## resource "google_cloud_run_service_iam_policy" "ide_noauth" {
##   location    = google_cloud_run_service.ide.location
##   project     = google_cloud_run_service.ide.project
##   service     = google_cloud_run_service.ide.name
## 
##   policy_data = data.google_iam_policy.noauth.policy_data
## }
## 
## # Cloud Run: Browser Policy
## resource "google_cloud_run_service_iam_policy" "browser_noauth" {
##   location    = google_cloud_run_service.browser.location
##   project     = google_cloud_run_service.browser.project
##   service     = google_cloud_run_service.browser.name
## 
##   policy_data = data.google_iam_policy.noauth.policy_data
## }
## 
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_instance
## 
## # Compute Image: qwiklabs-resources
## data "google_compute_image" "image_family" {
##   family  = var.gceMachineImage 
##   project = var.gceImageProject 
## }
## 
## 
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
## #
## 
## # GCE: Instance
## resource "google_compute_instance" "default" {
## 
##   name         = var.gceInstanceName 
##   machine_type = var.gceMachineType
##   zone         = var.gcp_zone 
## 
##   tags = var.gceInstanceTags
## 
##   boot_disk {
##     initialize_params {
##       image = data.google_compute_image.image_family.self_link 
##     }
##   }
## 
##   network_interface {
##     subnetwork      = google_compute_subnetwork.dev_subnet.name
## 
## ## Buganizer: https://b.corp.google.com/issues/238128500
## ## Overview: Minimize use of external IPs
## ##    access_config {
## ##      // Ephemeral IP
## ##    }
##   }
## 
##   service_account {
##     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
##     # email  = google_service_account.default.email
##     scopes = var.gceInstanceScope
##   }
## 
##   # Override to perform startup script
##   metadata_startup_script = var.gce_startup_script
## 
##   # Dependency - VPC Access connector 
##   depends_on = [google_vpc_access_connector.connector]
## }
