## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "service_url" {
  value       = module.la_labshell.ideEditorService 
  description = "URL of the IDE service"
}
