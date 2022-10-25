# Module: Virtual Private Cloud
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

module "la_vpc" {
  ## NOTE: When changing the source parameter, `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  # source = "./basics/vpc_network/stable"

  ## REMOTE: GitHub (Public) access - working
  source = "github.com/SureSkills/terraform-lab-foundation//solutions/pti_bcvmm_lab04/vpc_network/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCS instance
  vpc_network             = "dev-network"
  vpc_network_description = "Developer network"
  vpc_subnet              = "dev-subnetwork"
  vpc_region              = "us-central1"
  vpc_subnet_cidr         = "10.128.0.0/16"
}
