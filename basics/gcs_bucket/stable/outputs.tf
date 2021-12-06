## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "gcs_bucket_name" {
  value       = "${google_storage_bucket.cloud-bucket.name}"
  description = "Name of the GCS Bucket"
}
