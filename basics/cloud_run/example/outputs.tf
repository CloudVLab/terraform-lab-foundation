## Expose GCE properties

# Terraform Output values
output "service_url" {
  value = module.la_automl.gcr_service_url
}
