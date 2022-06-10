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
