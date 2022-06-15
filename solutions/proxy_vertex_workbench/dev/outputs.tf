## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

## output "notebook_url" {
##   value       = lookup("${data.google_compute_instance.notebook.metadata}", "proxy-url")
##   description = "Notebook instance proxy URI"
## }

output "notebook_service_url" {
  value       = google_cloud_run_service.jupyter.status[0].url
  description = "URL of the Proxy service"
}
