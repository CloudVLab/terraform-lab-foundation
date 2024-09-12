# Module: Virtual Private Cloud

module "la_vpc" {
  ## NOTE: When changing the source parameter, `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  # source = "./basics/vpc_network/stable"

  ## REMOTE: GitHub (Public) access - working
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/vpc_network/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the VPC 
  vpc_network             = var.vpcNetworkName 
  vpc_network_description = var.vpcDescription 
  vpc_subnet              = var.vpcSubnetName 
  vpc_region              = var.gcp_region
  vpc_subnet_cidr         = var.vpcSubnetCidr 
}

