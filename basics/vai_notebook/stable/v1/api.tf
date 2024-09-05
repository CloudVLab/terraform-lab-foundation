## # Enable the notebooks service
resource "google_project_service" "notebooks-api" {
  project = var.gcp_project_id
  service = "notebooks.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  # disable_dependent_services = true
}

# Enable the ap platform api
resource "google_project_service" "aiplatform-api" {
  project = var.gcp_project_id
  service = "aiplatform.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  # disable_dependent_services = true
}

