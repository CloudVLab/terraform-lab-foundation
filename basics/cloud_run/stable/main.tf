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


resource "google_cloud_run_service" "proxy" {
  name     = var.gcrService
  location = var.gcrRegion

  template {
    spec {
      containers {
        image = var.gcrImage 

        ## Add PROJECT_ID as environment variable
        env {
          name  = PROJECT_ID
          value = var.gcp_project_id
        }
      }
      container_concurrency = 2
    }

    # Add support for vpc connector
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"        = "3"
        "autoscaling.knative.dev/minScale"        = "1"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  # Dependency - Cloud Run API enabled
  depends_on = [google_project_service.run]
}


data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.proxy.location
  project  = google_cloud_run_service.proxy.project
  service  = google_cloud_run_service.proxy.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
