# ------------------ IDE: Integrated Development Environment   
# ------------------ Module Definition 
#

# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Virtual Private Cloud
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

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

  # Customise the GCS instance
  vpc_network             = "dev-network"
  vpc_network_description = "Developer network"
  vpc_subnet              = "dev-subnetwork"
  vpc_region              = "us-central1"
  vpc_subnet_cidr         = "10.128.0.0/16"
}


# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
# https://github.com/terraform-google-modules/terraform-google-network/tree/master/modules/firewall-rules

module "la_fw" {
  ## NOTE: When changing the source parameter, `terraform init` is required

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/vpc_firewall/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  ## Ex: Default Network
  # fwr_network      = "default" 
  ## Ex: Custom Network - Network Output variable
  fwr_network      = module.la_vpc.vpc_network_name

  # Firewall Policy - Repeatable list of objects
  fwr_rules = [
  {
    fwr_name                    = "serverless-to-vpc-connector"
    fwr_description             = "serverless-to-vpc-connector"
    fwr_source_ranges           = [ "107.178.230.64/26", "35.199.224.0/19" ]
    fwr_destination_ranges      = null
    fwr_source_tags             = null
    fwr_source_service_accounts = null
    fwr_target_tags             = ["vpc-connector"]
    fwr_target_service_accounts = null
    fwr_priority                = "1000"
    fwr_direction               = "INGRESS"

    # Allow List
    allow = [{
      protocol     = "icmp"
      ports        = null 
    },
    {
      protocol     = "tcp"
      ports        = [ "667" ]
    },
    {
      protocol     = "udp"
      ports        = [ "665-666" ]
    }]

    # Deny List
    deny = []

    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }

  },
  {
    fwr_name                    = "vpc-connector-egress"
    fwr_description             = "vpc-connector-egress"
    fwr_source_ranges           = null 
    fwr_destination_ranges      = null
    fwr_source_tags             = [ "vpc-connector" ] 
    fwr_source_service_accounts = null
    fwr_target_tags             = null 
    fwr_target_service_accounts = null
    fwr_priority                = "1000"
    fwr_direction               = "INGRESS"

    # Allow List
    allow = [{
      protocol     = "tcp"
      ports        = null 
    },
    {
      protocol     = "udp"
      ports        = null 
    },
    {
      protocol     = "icmp"
      ports        = null 
    }]

    # Deny List
    deny = []

    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }
  ]

  ## Firewall depends on existence of Network
  depends_on = [ module.la_vpc.vpc_network_name ]
}


# Solution: IDE environment 
# Local:  modules/stable
# Remote: github.com/CloudVLab/terraform-lab-foundation//solutions/ide_cloud_code/stable

# Output Value(s):
# - ideEditorService  : URL of IDE Service

module "la_ide_proxy" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  source = "./solutions/ide_cloud_code/dev"

  ## REMOTE: GitHub (Public) access - working 
  # source = "github.com/CloudVLab/terraform-lab-foundation//solutions/ide_gke_developer/dev"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id  = var.gcp_project_id 
  gcp_region      = var.gcp_region 
  gcp_zone        = var.gcp_zone 
  
  ## Properties: VPC
  vpcNetworkName  = module.la_vpc.vpc_network_name
  vpcSubnetName   = module.la_vpc.vpc_subnetwork_name

  ## IDE depends on existence of Network
  depends_on = [ module.la_vpc.vpc_network_name ]
}


# Solution: GCE instance with custom image
# Local:  modules/stable
# Remote: github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/stable

# Output Value(s):
# - ideEditorService  : URL of IDE Service
# - ideBrowserService : URL of Browser Service
# - ideInstanceName   : URL of Browser Service

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_instance
data "google_compute_image" "image_family" {
  family  = "cloud-code-codeserver" 
  project = "qwiklabs-resources"
}

# Module: Google Compute Engine
module "la_gce" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCE instance
  gce_region          = var.gcp_region 
  gce_zone            = var.gcp_zone 
  gce_machine_image   = data.google_compute_image.image_family.self_link
  gce_machine_network = module.la_vpc.vpc_subnetwork_name

  ## IDE depends on existence of Network
  depends_on = [ module.la_vpc.vpc_network_name]
}


## # Module: Google Kubernetes Engine
## module "la_gke_standard" {
##   source = "github.com/CloudVLab/terraform-lab-foundation//basics/gke_cluster/stable"
## 
##   # Pass values to the module
##   gcp_project_id = var.gcp_project_id
##   gcp_region     = var.gcp_region
##   gcp_zone       = var.gcp_zone
## 
##   # Customise the GKE instance
##   gke_name             = "lab_cluster" 
## }
