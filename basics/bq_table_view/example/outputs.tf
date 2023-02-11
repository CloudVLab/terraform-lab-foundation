## Expose BQ properties

# Terraform Output values
output "bq_table_view_id" {
  value       = module.la_bq_table_view.bq_table_id
  description = "Name of the BigQuery Table View"
}

