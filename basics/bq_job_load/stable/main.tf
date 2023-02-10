# BQ Job to load data from Cloud Storage
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_job
resource "google_bigquery_job" "job" {
  job_id        = var.bq_job_id 
  project       = var.gcp_project_id
  location      = var.bq_location

  labels = var.bq_job_label 

  load {
    source_uris = var.bq_job_source

    destination_table {
      project_id = var.gcp_project_id
      dataset_id = var.bq_dataset_id
      table_id   = var.bq_table_id 
    }

    skip_leading_rows     = var.bq_job_skip_row 
    schema_update_options = ["ALLOW_FIELD_RELAXATION", "ALLOW_FIELD_ADDITION"]
    write_disposition     = var.bq_job_write 
    source_format         = var.bq_job_format 
    autodetect            = true
  }
}
