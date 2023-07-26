# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vpc_access_connector

module "la_serverless_vpc_access" {
  ## NOTE: When changing the source parameter, `terraform init` is required

  ## REMOTE: GitHub (Public) access - working
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/vpc_connector/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCS instance
  sva_name                   = "ideconn"
  sva_network                = module.la_vpc.vpc_network_name
  sva_subnet_cidr            = "10.8.0.0/28"
  sva_connector_machine_type = "e2-micro"
 
  ## Depends on Network
  depends_on = [ module.la_vpc ]
}
