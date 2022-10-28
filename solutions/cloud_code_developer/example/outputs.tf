## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "service_url" {
  value       = module.la_ccd.ideEditorService 
  description = "URL of the IDE service"
}

output "gce_instance_name" {
  value       = module.la_ccd.ideInstanceName
  description = "Name of the GCE instance"
}

# Name of the VPC
output "vpc_name" {
  value       = "${module.la_ccd.ideVPC}"
  description = "Name of the VPC"
}

# Name of the Subnet
output "subnet_name" {
  value       = "${module.la_ccd.ideSubnet}"
  description = "Name of the Subnet"
}
