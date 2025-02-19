# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
#

##---------------------------------------------------------------------------
## Container Cluster: Autopilot Example

# GKE cluster
resource "google_container_cluster" "tfer-gke" {
#  provider    = google-beta
  project     = var.gcp_project_id
  name        = var.gkeClusterName
  location    = var.gcp_region
  description = var.gkeDescription

  network    = var.gkeNetwork
  subnetwork = var.gkeSubnetwork

  addons_config {
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }
  }

  database_encryption {
    state = "DECRYPTED"
  }

  binary_authorization {
    # Equates to old enable_binary_authorization = "true"
    # evaluation_mode = "PROJECT_SINGLETON_POLICY_ENFORCE"
    evaluation_mode = "DISABLED"
  }

  enable_autopilot            = var.gkeIsAutopilot 
  # enable_binary_authorization = var.gkeIsBinAuth 
  # enable_intranode_visibility = false
  enable_kubernetes_alpha     = false
  enable_l4_ilb_subsetting    = false
  enable_legacy_abac          = false
  enable_tpu                  = false
  initial_node_count          = var.gkeInitialNodeCount

  # Enable IP Aliasing
  ip_allocation_policy {
    #    cluster_ipv4_cidr_block  = "10.24.0.0/14"
    #    services_ipv4_cidr_block = "10.28.0.0/20"
  }


  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }

  # logging_service = "logging.googleapis.com/kubernetes"

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }

  # monitoring_service = "monitoring.googleapis.com/kubernetes"
  #  name               = "gke"
  # network            = "projects/qwiklabs-gcp-04-22edd551c1ab/global/networks/default"
  # subnetwork = "projects/qwiklabs-gcp-04-22edd551c1ab/regions/us-central1/subnetworks/default"
  # network    = google_compute_network.vpc.name
  # subnetwork = google_compute_subnetwork.subnet.name

  networking_mode = var.gkeModeVpcNative

  ## Ref:  https://buganizer.corp.google.com/issues/365912554
  # node_pool_defaults {
  #   node_config_defaults {
  #     logging_variant = "DEFAULT"
  #   }
  # }

  notification_config {
    pubsub {
      enabled = false
    }
  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = false

    master_global_access_config {
      enabled = false
    }
  }

  release_channel {
    channel = "REGULAR"
  }
}
