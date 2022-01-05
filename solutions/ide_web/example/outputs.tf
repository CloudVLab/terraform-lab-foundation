## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "service_url" {
  value       = module.la_ide.ideEditorService 
  description = "URL of the IDE service"
}

output "live_server_url" {
  value       = module.la_ide.ideBrowserService
  description = "URL of the Browser service"
}

output "resource_instance_name" {
  value       = module.la_ide.ideInstanceName
  description = "Name of the GCE instance"
}
