# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application
#

resource "google_app_engine_application" "app" {
  project       = var.gcp_project_id
  location_id   = var.gae_location 
  database_type = var.gae_hasDatabase ? var.gae_db_type : null 
}
