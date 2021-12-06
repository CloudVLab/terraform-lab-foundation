## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "vpc_network_name" {
  value       = "${google_compute_network.dev_network.name}"
  description = "Name of the VPC network"
}

output "vpc_subnetwork_name" {
  value       = "${google_compute_subnetwork.dev_subnet.name}"
  description = "Name of the VPC subnet"
}
