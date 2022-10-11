data "google_client_config" "current" {}

resource "google_compute_network" "apigee_network" {
  name       = var.apigee_name
  depends_on = [google_project_service.service_networking_api]
}

resource "google_compute_global_address" "apigee_range" {
  name          = "apigee-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.apigee_network.id
}

resource "google_service_networking_connection" "apigee_vpc_connection" {
  network                 = google_compute_network.apigee_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.apigee_range.name]
  depends_on              = [google_project_service.service_networking_api]
}

resource "google_apigee_organization" "org" {
  analytics_region   = var.region_name
  project_id         = data.google_client_config.current.project
  authorized_network = google_compute_network.apigee_network.id
  depends_on         = [google_service_networking_connection.apigee_vpc_connection]
}


// API Dependancy
resource "google_project_service" "service_networking_api" {
  project                    = var.gcp_project_id
  service                    = "servicenetworking.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "apigee_google_api" {
  project                    = var.gcp_project_id
  service                    = "apigee.googleapis.com"
  disable_dependent_services = true
  depends_on                 = [google_project_service.service_networking_api]
}