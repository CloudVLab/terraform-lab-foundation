## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "ideEditorService" {
  ## value       = "${google_cloud_run_service.ide.status[0].url}"
  value       = "${google_cloud_run_v2_service.ide.uri}"
  description = "URL of the IDE service"
}

output "ideInstanceName" {
  value       = "${var.gceInstanceName}"
  description = "Name of the GCE instance"
}
