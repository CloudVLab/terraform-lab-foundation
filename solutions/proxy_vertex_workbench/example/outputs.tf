## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "notebook_service_url" {
  value       = module.la_vertex_workbench.workbench_service_url
  description = "URL of the Vertex notebook service"
}
