## IDE - Cloud Run Direct VPC to Compute Instance
## ----------------------------------------------------------------------------

# 1. Enable Googleapis  
# 2. Create a Network 
# 3. Add Firewall Rules
# 4. Provision a compute instance
# 5. Setup Cloud Run container
# 6. Add Cloud Run Access (allUsers)


## Googleapis 
## ----------------------------------------------------------------------------

# Module: Enable Google APIs
module "la_api_batch" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/dev"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the APIs
  ## VPC Access   - Direct VPC
  ## Run          - Cloud Run
  ## AI companion - Duet AI
  api_services = [ "vpcaccess.googleapis.com", "run.googleapis.com", "cloudaicompanion.googleapis.com" ] 
}

## Create a VPC + Subnet
## ----------------------------------------------------------------------------
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

## Create Firewall Rules
## ----------------------------------------------------------------------------
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

  fwr_network      = module.la_vpc.vpc_network_name

  # Firewall Policy - Repeatable list of objects
  fwr_rules = [
    {
      fwr_name                    = "network-allow-internal"
      fwr_description             = "Private internal communication"
      fwr_source_ranges           = [ "${var.vpcSubnetCidr}" ]
      fwr_destination_ranges      = null
      fwr_source_tags             = null
      fwr_source_service_accounts = null
      fwr_target_tags             = null 
      fwr_target_service_accounts = null
      fwr_priority                = "65534"
      fwr_direction               = "INGRESS"

      # Allow List
      allow = [
        {
          protocol     = "tcp"
          ports        = [ "0-65535" ] 
        },
        {
          protocol     = "udp"
          ports        = [ "0-65535" ] 
        }
      ]

      # Deny List
      deny = []

      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }

## MOVE THIS TO LAB DEFINITION
##     },
##     {
##       fwr_name                    = "crossover-allow-internal"
##       fwr_description             = "Custom and Default VPC Internal communication"
##       fwr_source_ranges           = [ "${var.vpcSubnetCidr}", ${var.vpcDefaultCidr} ]
##       fwr_destination_ranges      = null
##       fwr_source_tags             = null
##       fwr_source_service_accounts = null
##       fwr_target_tags             = null 
##       fwr_target_service_accounts = null
##       fwr_priority                = "65534"
##       fwr_direction               = "INGRESS"
## 
##       # Allow List
##       allow = [
##         {
##           protocol     = "tcp"
##           ports        = [ "0-65535" ] 
##         },
##         {
##           protocol     = "udp"
##           ports        = [ "0-65535" ] 
##         }
##       ]
## 
##       # Deny List
##       deny = []
## 
##       log_config = {
##         metadata = "INCLUDE_ALL_METADATA"
##       }
    }
 ]

  ## Firewall depends on existence of Network
  depends_on = [ module.la_vpc.vpc_network_name ]
}


## Create a Compute Instance 
## ----------------------------------------------------------------------------

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_instance
data "google_compute_image" "image_family" {
    family  = var.gceMachineImage
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
  gce_name            = "cls-vm" 
  gce_metadata        = null
  gce_startup_script  = null

  ## Overrides
  gce_machine_image   = data.google_compute_image.image_family.self_link
  gce_region          = var.gcp_region 
  gce_zone            = var.gcp_zone 
  gce_machine_type    = var.gceMachineType 
  gce_tags            = ["lab-vm"] 
  gce_machine_network = module.la_vpc.vpc_subnetwork_name

  #gce_machine_network = google_compute_subnetwork.dev_subnet.name
  #gce_scopes          = ["cloud-platform"] 
  #gce_service_account = "default"
  #gce_startup_script   = "${file("./scripts/lab-init")}"
}

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform
#

## Create a Cloud Run container 
## ----------------------------------------------------------------------------

resource "google_cloud_run_v2_service" "ide" {
  name     = var.gcrIDEService 
  location = var.gcp_region 
  launch_stage = "BETA"
  template {
    containers {
      image = var.gcrContainerImage 
    }
    vpc_access{
      network_interfaces {
        network = module.la_vpc.vpc_network_name
        subnetwork = module.la_vpc.vpc_subnetwork_name
        # network = google_compute_network.dev_network.id 
        # subnetwork = google_compute_subnetwork.dev_subnet.id
        tags = var.gceInstanceTags
      }
      egress = "ALL_TRAFFIC"
    }
  }
}

resource "google_cloud_run_service_iam_binding" "public" {
  location = google_cloud_run_v2_service.ide.location
  service  = google_cloud_run_v2_service.ide.name
  role     = "roles/run.invoker"
  members  = [
    "allUsers"
  ]
}

## MOVE THIS TO LAB DEFINITION
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform
## #
## 
## ##---------------------------------------------------------------------------
## ## Container Cluster: Separate Managed Node Pool Example
## 
## # GKE cluster
## resource "google_container_cluster" "primary" {
##   # provider = google-beta
##   name     = var.gkeClusterName
##   location = var.gcp_region
## 
##   # Define VPC configuration
##   network    = var.isCustomNetwork ? module.la_vpc.vpc_network_name: "default"
##   subnetwork = var.isCustomNetwork ? module.la_vpc.vpc_subnetwork_name : "default"
## 
##   private_cluster_config {
##     enable_private_endpoint = false
##     enable_private_nodes    = var.isPrivateCluster ? true : false
##     master_ipv4_cidr_block  = var.isPrivateCluster ? var.gkeMasterIPv4CIDRBlock : null
##   }
## 
##   # Enable GKE Autopilot
##   enable_autopilot = true
## 
##   # Release channel GKE clusters.
##   release_channel {
##     channel = "STABLE"
##   }
## 
##   # Dependency - Cloud Run API enabled
##   ##   depends_on = [google_compute_instance.default]
## }
