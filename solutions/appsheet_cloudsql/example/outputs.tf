## Expose CloudSQL properties

# Terraform Output values
# output "cloud_sql_instance" {
#   sensitive = false
#   value = module.la_cloudsql.cloud_sql_instance
#   description = "Cloud SQL Instance"
# }

output "cloud_sql_private_ip" {
  sensitive = false
  value = module.la_cloudsql.cloud_sql_private_ip
  description = "Cloud SQL Private IP"
}

output "cloud_sql_public_ip" {
  sensitive = false
  value = module.la_cloudsql.cloud_sql_public_ip
  description = "Cloud SQL Public IP"
}
