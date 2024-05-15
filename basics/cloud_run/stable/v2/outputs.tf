## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "service_url" {
  #  value       = "${google_cloud_run_service.proxy.status[0].url}"
  value       = google_cloud_run_v2_service.proxy.uri
  description = "URL of the Cloud Run service"
}
