## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "cloud_sql_instance" {
  value       = google_sql_database_instance.mysql
  description = "Object instance"
}

output "cloud_sql_private_ip" {
  value       = google_sql_database_instance.mysql.private_ip_address
  description = "Object instance"
}

output "cloud_sql_public_ip" {
  value       = google_sql_database_instance.mysql.public_ip_address
  description = "Object instance"
}
