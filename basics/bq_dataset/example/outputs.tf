## Expose BQ properties

# Terraform Output values
output "bq_dataset_id" {
  value       = module.la_bq_dataset.bq_dataset_id
  description = "Name of the BigQuery dataset"
}

