## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "service_url" {
  value       = module.la_ccd.ideEditorService 
  description = "URL of the IDE service"
}

output "live_server_url" {
  value       = module.la_ccd.ideBrowserService
  description = "URL of the Browser service"
}

output "resource_instance_name" {
  value       = module.la_ccd.ideInstanceName
  description = "Name of the GCE instance"
}
