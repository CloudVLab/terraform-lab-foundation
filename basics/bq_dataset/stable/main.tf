# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset

# Create a Dataset
resource "google_bigquery_dataset" "default" {
  dataset_id    = var.bq_dataset_id 
  friendly_name = var.bq_dataset_friendly_name 
  description   = var.bq_dataset_description 
  #location     = var.gcp_region
  location      = var.bq_location
  project       = var.gcp_project_id

  #default_table_expiration_ms = var.bq_table_expiration 

  labels = {
    env = "prod"
  }
}
