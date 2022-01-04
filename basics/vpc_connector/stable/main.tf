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
  provider       = google-beta
  name           = "ideconn"
  region         = var.gcp_region
  #network       = google_compute_network.dev_network.name
  network        = var.sva_network 
  #ip_cidr_range = "10.8.0.0/28"
  ip_cidr_range  = var.sva_subnet_cidr 

  # Note: valid options: f1-micro, e2-micro, e2-standard-4
  machine_type = var.sva_connector_machine_type

  depends_on = [
    # google_project_service.vpcaccess-api, google_compute_network.dev_network
    google_project_service.vpcaccess-api
  ]
}

