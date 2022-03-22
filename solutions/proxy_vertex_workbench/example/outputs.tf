## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "notebook_service_url" {
  value       = module.la_vertex_workbench.notebook_url
  description = "URL of the Vertex notebook service"
}
