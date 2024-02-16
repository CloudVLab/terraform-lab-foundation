## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
## resource "google_compute_network" "dev_network" {
##   name                    = var.vpcNetworkName
##   description             = "Developer network"
##   auto_create_subnetworks = false
## }
## 
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
## resource "google_compute_subnetwork" "dev_subnet" {
##   name          = var.vpcSubnetName
##   ip_cidr_range = "10.128.0.0/16"
##   region        = var.gcp_region
##   network       = google_compute_network.dev_network.id
## }
## 
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
## resource "google_compute_firewall" "serverless-to-vpc-connector" {
##   name          = "serverless-to-vpc-connector"
##   network       = google_compute_network.dev_network.name
##   source_ranges = ["107.178.230.64/26", "35.199.224.0/19"]
##   direction     = "INGRESS"
## 
##   # Enable INGRESS
##   allow {
##     protocol = "icmp"
##   }
##   allow {
##     protocol = "tcp"
##     ports    = ["667"]
##   }
## 
##   allow {
##     protocol = "udp"
##     ports    = ["665-666"]
##   }
## 
##   # source_tags = ["web"]
##   target_tags = ["vpc-connector"]
## 
##   depends_on = [google_compute_network.dev_network]
## }
## 
## resource "google_compute_firewall" "vpc-connector-to-serverless" {
##   name               = "vpc-connector-to-serverless"
##   network            = google_compute_network.dev_network.name
##   destination_ranges = ["107.178.230.64/26", "35.199.224.0/19"]
##   direction          = "EGRESS"
## 
##   # Enable EGRESS
##   allow {
##     protocol = "icmp"
##   }
##   allow {
##     protocol = "tcp"
##     ports    = ["667"]
##   }
## 
##   allow {
##     protocol = "udp"
##     ports    = ["665-666"]
##   }
## 
##   target_tags = ["vpc-connector"]
## 
##   depends_on = [google_compute_network.dev_network]
## }
## 
## 
## resource "google_compute_firewall" "vpc-connector-health-check" {
##   name          = "vpc-connector-health-check"
##   network       = google_compute_network.dev_network.name
##   source_ranges = ["130.211.0.0/22", "35.191.0.0/16", "108.170.220.0/23"]
##   direction     = "INGRESS"
## 
##   # Enable INGRESS
##   allow {
##     protocol = "tcp"
##     ports    = ["667"]
##   }
## 
##   target_tags = ["vpc-connector"]
## 
##   depends_on = [google_compute_network.dev_network]
## }
## 
## 
## resource "google_compute_firewall" "vpc-connector-egress" {
##   name      = "vpc-connector-egress"
##   network   = google_compute_network.dev_network.name
##   direction = "INGRESS"
## 
##   # Enable INGRESS
##   allow {
##     protocol = "tcp"
##   }
##   allow {
##     protocol = "udp"
##   }
##   allow {
##     protocol = "icmp"
##   }
## 
##   source_tags = ["vpc-connector"]
## 
##   depends_on = [google_compute_network.dev_network]
## }
## 
## 
## 
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vpc_access_connector
## 
## # Enable the vpc access service
## resource "google_project_service" "vpcaccess-api" {
##   project = var.gcp_project_id
##   service = "vpcaccess.googleapis.com"
## 
##   timeouts {
##     create = "30m"
##     update = "40m"
##   }
## 
##   # disable_dependent_services = true
## }
## 
## resource "google_vpc_access_connector" "connector" {
##   provider      = google-beta
##   name          = "ideconn"
##   region        = var.gcp_region
##   network       = google_compute_network.dev_network.name
##   ip_cidr_range = "10.8.0.0/28"
## 
##   # Note: valid options: f1-micro, e2-micro, e2-standard-4
##   machine_type = var.vpcConnectorMachineType
## 
##   depends_on = [
##     google_project_service.vpcaccess-api, google_compute_network.dev_network
##   ]
## }
## 
## 
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service
## #
## # Enable the Cloud Run service
## resource "google_project_service" "run" {
##   project = var.gcp_project_id
##   service = "run.googleapis.com"
## 
##   timeouts {
##     create = "30m"
##     update = "40m"
##   }
## 
##   # disable_dependent_services = true
## }
## 
## 
## resource "google_cloud_run_service" "ide" {
##   name     = var.gcrIDEService
##   # location = var.gcrRegion
##   location = var.gcp_region
## 
##   template {
##     spec {
##       containers {
##         image = "gcr.io/qwiklabs-resources/ide-proxy:latest"
##       }
##       container_concurrency = 2
##     }
## 
##     # Add support for vpc connector
##     metadata {
##       annotations = {
##         "autoscaling.knative.dev/maxScale"        = "3"
##         "autoscaling.knative.dev/minScale"        = "1"
##         "run.googleapis.com/vpc-access-egress"    = "all"
##         "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
##       }
##     }
##   }
## 
##   traffic {
##     percent         = 100
##     latest_revision = true
##   }
## 
##   # Dependency - Cloud Run API enabled
##   # depends_on = [google_project_service.run]
##   depends_on = [google_project_service.run, google_compute_instance.default]
## }
## 
## 
## data "google_iam_policy" "noauth" {
##   binding {
##     role = "roles/run.invoker"
##     members = [
##       "allUsers",
##     ]
##   }
## }
## 
## resource "google_cloud_run_service_iam_policy" "noauth" {
##   location = google_cloud_run_service.ide.location
##   project  = google_cloud_run_service.ide.project
##   service  = google_cloud_run_service.ide.name
## 
##   policy_data = data.google_iam_policy.noauth.policy_data
## }
## 
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_instance
## data "google_compute_image" "image_family" {
##   family  = var.gceMachineImage
##   project = "qwiklabs-resources"
## }
## 
## 
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
## #
## resource "google_compute_instance" "default" {
## 
##   name         = var.gceInstanceName
##   machine_type = var.gceMachineType
##   zone         = var.gceInstanceZone
## 
##   tags = var.gceInstanceTags
## 
##   boot_disk {
##     initialize_params {
##       image = data.google_compute_image.image_family.self_link
##     }
##   }
## 
##   network_interface {
##     # network       = google_compute_network.dev_network.name
##     subnetwork = google_compute_subnetwork.dev_subnet.name
## 
##     access_config {
##       // Ephemeral IP
##     }
##   }
## 
##   # Add Key/Value pair e.g. SSH keys here
##   # metadata = {
##   #  foo = "bar"
##   # }
## 
##   # metadata_startup_script = "echo Welcome to Octopus > /tmp/octopus.txt"
## 
##   service_account {
##     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
##     # email  = google_service_account.default.email
##     scopes = var.gceInstanceScope
##   }
## 
##   # Dependency - VPC Access connector 
##   depends_on = [google_vpc_access_connector.connector]
## }

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
    }
    {
      fwr_name                    = "default-allow-internal"
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

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform
#

##---------------------------------------------------------------------------
## Container Cluster: Separate Managed Node Pool Example

# GKE cluster
resource "google_container_cluster" "primary" {
  # provider = google-beta
  name     = var.gkeClusterName
  location = var.gcp_region

  # Define VPC configuration
  network    = var.isCustomNetwork ? module.la_vpc.vpc_network_name: "default"
  subnetwork = var.isCustomNetwork ? module.la_vpc.vpc_subnetwork_name : "default"

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = var.isPrivateCluster ? true : false
    master_ipv4_cidr_block  = var.isPrivateCluster ? var.gkeMasterIPv4CIDRBlock : null
  }

  # Enable GKE Autopilot
  enable_autopilot = true

  # Release channel GKE clusters.
  release_channel {
    channel = "STABLE"
  }

  # Dependency - Cloud Run API enabled
  ##   depends_on = [google_compute_instance.default]
}
