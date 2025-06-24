## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "vpc_subnetwork_name" {
  value       = module.la_vpc.vpc_subnetwork_name
  description = "Name of the VPC subnet"
}

output "vpc_subnet_self_link" {
  value       = module.la_vpc.vpc_subnet_self_link
  description = "Self Link to the VPC subnet"
}
