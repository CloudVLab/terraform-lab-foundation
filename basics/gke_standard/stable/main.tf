# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform
#

##---------------------------------------------------------------------------
## Container Cluster: Separate Managed Node Pool Example

# GKE cluster
resource "google_container_cluster" "tfer-gke" {
#  provider    = google-beta
  project     = var.gcp_project_id
  name        = var.gkeClusterName
  location    = var.gcp_zone
  description = var.gkeDescription


  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = var.gkeRemoveDefaultNodePool 

  network    = var.gkeNetwork
  subnetwork = var.gkeSubnetwork

  addons_config {
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }

    network_policy_config {
      disabled = true
    }
  }

  cluster_autoscaling {
    enabled = false
    auto_provisioning_defaults {
      image_type = var.gkeImageType 
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

  default_max_pods_per_node = 110
  # enable_autopilot            = false
  # enable_binary_authorization = false
  enable_intranode_visibility = false
  enable_kubernetes_alpha     = false
  enable_l4_ilb_subsetting    = false
  enable_legacy_abac          = false
  enable_shielded_nodes       = true
  enable_tpu                  = false
  initial_node_count          = var.gkeInitialNodeCount

  # cluster_ipv4_cidr = "10.24.0.0/14"

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

  network_policy {
    enabled  = false
    provider = "PROVIDER_UNSPECIFIED"
  }

  networking_mode = var.gkeModeVpcNative

  node_pool_defaults {
    node_config_defaults {
      logging_variant = "DEFAULT"
    }
  }

  #  node_version = "1.24.8-gke.2000"

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

  resource_labels = {
    mesh_id = var.gkeLabelMeshId
  }

  service_external_ips_config {
    enabled = false
  }

  workload_identity_config {
    workload_pool = "${var.gcp_project_id}.svc.id.goog"
  }

}
