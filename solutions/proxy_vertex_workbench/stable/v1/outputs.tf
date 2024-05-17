## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "workbench_service_url" {
  value       = module.la_cloud_run_v2.service_url
  description = "URL of the Workbench service"
}
