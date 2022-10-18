## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "gcr_service_url" {
  value       = google_cloud_run_service.proxy.status[0].url
  description = "URL of the Cloud Run service"
}
