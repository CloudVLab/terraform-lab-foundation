## Expose Project properties

# Terraform Output values
output "project_id" {
  value = var.gcp_project_id
}

output "gcp_region" {
  value = var.gcp_region
}
output "gcp_zone" {
  value = var.gcp_zone
}
