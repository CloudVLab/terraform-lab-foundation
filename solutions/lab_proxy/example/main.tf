# ------------------ Lab Proxy 
# ------------------ Module Definition 
#

# Solution: Lab Proxy 
# Local:  modules/dev
# Remote: github.com/CloudVLab/terraform-lab-foundation//solutions/lab_proxy/dev

# Output Value(s):
# - ideEditorService  : URL of IDE Service

module "la_ide_proxy" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/lab_proxy/dev"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id  = var.gcp_project_id 
  gcp_region      = var.gcp_region 
  gcp_zone        = var.gcp_zone 
  
  ## Properties: VPC - custom network 
  ## vpcNetworkName  = module.la_vpc.vpc_network_name
  ## vpcSubnetName   = module.la_vpc.vpc_subnetwork_name

  ## IDE depends on existence of Network
  ## depends_on = [ module.la_vpc.vpc_network_name ]
}
