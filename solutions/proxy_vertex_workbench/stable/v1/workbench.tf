module "la_vai_workbench" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  # source = "./basics/vai_workbench/stable"

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/vai_workbench/stable"
  ## source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/vai_workbench/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region 
  gcp_zone       = var.gcp_zone 

  ## Custom Properties
  vai_workbench_name  = "cls-vertex-workbench" 
  vai_machine_subnet  = module.la_vpc.vpc_subnet_self_link 
  # vai_tags            = [ "cls", "lab-vm", "http-server", "https-server" ]

  # vai_machine_subnet      = module.la_vpc.vpc_subnetwork_name 
  # vai_machine_network     = module.la_vpc.vpc_network_name 
  # vai_machine_network     = module.la_vpc.vpc_network_self_link
  vai_post_startup_script = var.gcePostStartupScript  

  # Give the JIT API time to be enabled
  depends_on = [ time_sleep.wait_api_delay ]
}
