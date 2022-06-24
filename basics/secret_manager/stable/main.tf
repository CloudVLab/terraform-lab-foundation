# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version
#

resource "google_secret_manager_secret" "lab-secret" {
  secret_id = var.secret_manager_identifier 

  labels = {
    label = var.secret_manager_label 
  }

  replication {
    automatic = true
  }
}

# Reference:
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/secret_manager_secret_version
#

resource "google_secret_manager_secret_version" "lab-data" {
  secret = google_secret_manager_secret.lab-secret.id

  secret_data = var.secret_manager_data 
}

## Access the project number
data "google_project" "project" {
}

## Add Secret accessor role/permission
## https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service#example-usage---cloud-run-service-secret-environment-variables
resource "google_secret_manager_secret_iam_member" "endpoint-secret-access" {
  secret_id = google_secret_manager_secret.lab-secret.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
  depends_on = [ google_secret_manager_secret.secret_id ]
}
