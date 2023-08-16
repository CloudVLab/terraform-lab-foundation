## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

# Terraform Output values
output "service_url" {
    value = module.la_cloud_run.gcr_service_url
}
