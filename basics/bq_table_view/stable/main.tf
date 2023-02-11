# Create a BQ Table View
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table#nested_view
resource "google_bigquery_table" "default" {
  deletion_protection = false
  dataset_id          = var.bq_dataset_id 
  project             = var.gcp_project_id
  table_id            = var.bq_table_id 
  description         = var.bq_table_description 

  ## View configuration
  view {
    query = var.bq_view_query 
    use_legacy_sql = var.bq_view_legacy_sql 
  }
}
