# Enable the Googleapi service
resource "google_project_service" "service-api" {
  project = var.gcp_project_id
  service = var.api_service_name 

  timeouts {
    create = "30m"
    update = "40m"
  }

  # State of the api
  disable_dependent_services = var.api_service_deny
}
