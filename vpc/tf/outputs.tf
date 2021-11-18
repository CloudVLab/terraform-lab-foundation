## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "vpc_instance_name" {
  value       = "${google_compute_network.vpc.name}"
  description = "Name of the VPC instance"
}
