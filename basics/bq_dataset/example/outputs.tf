## Expose BQ properties

# Terraform Output values
output "bq_dataset_id" {
  value       = google_bigquery_dataset.default.dataset_id
  description = "Name of the BigQuery dataset"
}

