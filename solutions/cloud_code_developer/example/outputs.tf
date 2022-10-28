## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "service_url" {
  value       = module.la_ccd.ideEditorService 
  description = "URL of the IDE service"
}

output "resource_instance_name" {
  value       = module.la_ccd.ideInstanceName
  description = "Name of the GCE instance"
}

# Name of the VPC
output "ideVPC" {
  value       = "${module.la_vpc.vpc_network_name}"
  description = "Name of the VPC"
}

# Name of the Subnet
output "ideSubnet" {
  value       = "${module.la_vpc.vpc_subnetwork_name}"
  description = "Name of the Subnet"
}
