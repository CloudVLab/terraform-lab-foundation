## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "bq_table_id" {
  value       = google_bigquery_table.default.table_id
  description = "Name of the BigQuery table id"
}
