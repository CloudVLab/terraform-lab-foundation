## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

# URL of Service
output "ideEditorService" {
  value       = "${module.la_ide_proxy.ideEditorService}"
  description = "URL of the IDE service"
}

# Name of the GCE Instance
output "ideInstanceName" {
  value       = "${module.la_gce.gce_instance_name}"
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
