# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset

# Create a new BQ Table
resource "google_bigquery_table" "default" {
  deletion_protection = false
  dataset_id          = var.bq_dataset_id 
  table_id            = var.bq_table_id 
  description         = var.bq_table_description 
}
