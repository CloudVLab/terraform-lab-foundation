## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "vpc_subnetwork_name" {
  value       = "${google_compute_subnetwork.dev_subnet.name}"
  description = "Name of the VPC subnet"
}

output "vpc_subnet_self_link" {
  value       = "${google_compute_subnetwork.dev_subnet.self_link}"
  description = "Self Link to the VPC subnet"
}

output "vpc_subnet_cidr_range" {
  value       = google_compute_subnetwork.dev_subnet.ip_cidr_range
  description = "CIDR range"
}
