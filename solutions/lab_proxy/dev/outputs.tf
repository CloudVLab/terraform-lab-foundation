## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "ideEditorService" {
  value       = google_cloud_run_service.ide.status[0].url
  description = "URL of the IDE service"
}
