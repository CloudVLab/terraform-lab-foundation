# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform
#

##---------------------------------------------------------------------------
## Container Cluster: Separate Managed Node Pool Example

# GKE cluster
resource "google_container_cluster" "primary" {
  provider    = google-beta
  name        = var.gkeClusterName
  location    = var.gkeLocation
  description = var.gkeDescription 

  # Define VPC configuration
  network    = var.gkeNetwork 
  subnetwork = var.gkeSubnetwork 

  # Set networking mode
  networking_mode = var.gkeNetworkingMode ? var.gkeModeVpcNative : var.gkeModeRoutes 

  ## NOTE: Set null value where false value is set
  # Set this value if not using GKE Autopilot
  initial_node_count = var.gkeInitialNodeCount ? var.gkeInitialNodeCount : null

  ## NOTE: Set null value where false value is set
  # Condition setting to variable. If defined set to variable, otherwise default to false 
#  enable_binary_authorization = var.gkeIsBinAuth ? var.gkeIsBinAuth : null 
 
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
##    service_account = google_service_account.default.email
    machine_type = var.gkeMachine 
##    oauth_scopes = [
##      "https://www.googleapis.com/auth/cloud-platform"
##    ]
##    labels = {
##      foo = "bar"
##    }
##    tags = ["foo", "bar"]
  }

  ## NOTE: Set null value where false value is set
  # Condition setting to variable. If defined set to variable, default to false
  # enable_autopilot            = var.gkeIsAutopilot ? var.gkeIsAutopilot : null 

#  private_cluster_config {
#    enable_private_endpoint = var.gkeIsPrivateEndpoint 
#    enable_private_nodes    = var.gkeIsPrivateCluster ? true : false
#    master_ipv4_cidr_block  = var.gkeIsPrivateCluster ? var.gkeMasterIPv4CIDRBlock : null
#  }
    

  ## TODO: Need to refine this 
  # Enable Alias IPs
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.gkeIsPrivateCluster ? "/14" : null
    services_ipv4_cidr_block = var.gkeIsPrivateCluster ? "/20" : null
  }

  # Release channel GKE clusters.
  release_channel {
    channel = "STABLE"
  }
}
