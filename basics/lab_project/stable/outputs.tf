## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

## output "gcp_project_id" {
##   value       = "${var.gcp_project_id}"
##   description = "Project Identier"
## }
## 
## output "gcp_project_number" {
##   value       = data.google_project.project.number 
##   description = "Project Identifier"
## }

output "gcp_project_region" {
  value       = "${var.gcp_region}"
  description = "Project Region"
}

output "gcp_project_zone" {
  value       = "${var.gcp_zone}"
  description = "Project Zone"
}
