## Expose BQ properties

# Terraform Output values
output "bq_table_id" {
  value       = module.la_bq_table.bq_table_id
  description = "Name of the BigQuery Table"
}

