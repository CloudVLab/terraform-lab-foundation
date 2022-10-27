## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------


output "ideEditorService" {
  value       = "module.la_ide_proxy.ideEditorService"
  description = "URL of the IDE service"
}


output "ideInstanceName" {
  value       = "module.la_gce.gce_instance_name"
  description = "Name of the GCE instance"
}
