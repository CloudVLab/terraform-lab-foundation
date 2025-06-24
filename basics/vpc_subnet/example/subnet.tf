# Module: Virtual Private Cloud
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

module "la_vpc_subnet" {
  ## NOTE: When changing the source parameter, `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  # source = "./basics/vpc_network/stable"

  ## REMOTE: GitHub (Public) access - working
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/vpc_subnet/stable/v1"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/vpc_subnet/stable/v1"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the VPC 
  # vpc_network     = "dev-network"
  vpc_network     = module.la_vpc.vpc_network_name
  vpc_subnet      = "dev-subnetwork"
  vpc_region      = var.gcp_region 
  vpc_subnet_cidr = "10.1.0.0/24"
}
