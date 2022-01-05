## Expose GCE properties

# Terraform Output values
output "gcs_bucket_name" {
  value = ${module.la_gcs.gcs_bucket_name}
  description = "Name of the Google Storage bucket"
}

