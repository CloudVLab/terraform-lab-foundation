## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "notebook_name" {
  value        = "${var.vai_notebook_name}"
  description = "Vertex VM instance name."
}

# output "gce_instance_name" {
#   value       = "${var.vm_name}"
#   description = "Name of the GCE instance"
# }
# 
# output "notebook_url" {
#   value       = "${google_notebooks_instance.vertex_instance.proxy_uri}"
#   description = "Notebook instance proxy URI"
# }
# 
# output "notebook_instance" {
#   value       = "${google_notebooks_instance.vertex_instance}"
#   description = "Notebook instance"
# }
