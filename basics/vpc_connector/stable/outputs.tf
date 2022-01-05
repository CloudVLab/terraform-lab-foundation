## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "sva_connection_name" {
  value       = "${google_vpc_access_connector.connector.name}"
  description = "Serverless VPC Access name"
}

