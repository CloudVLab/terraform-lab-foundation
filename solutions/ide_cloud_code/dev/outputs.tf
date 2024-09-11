## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "ideEditorService" {
  #  value       = "${google_cloud_run_service.ide.status[0].url}"
  value       = "${google_cloud_run_v2_service.ide.uri}"
  description = "URL of the IDE service"
}

output "ideInstanceName" {
  value       = "${var.gceInstanceName}"
  description = "Name of the GCE instance"
}

## output "host_ip" {
##     value       = "${module.la_gce.gce_external_ip}"
##     description = "External IP address of GCE instance"
## }
## 
## output "host_port" {
##     value       = "8000"
##     description = "Wagtail default address"
## }

