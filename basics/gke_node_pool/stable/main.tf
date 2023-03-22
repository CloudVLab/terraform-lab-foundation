# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform
#

resource "google_container_node_pool" "tfer-gke_default-pool" {
  project        = var.gcp_project_id
  node_locations = ["${var.gcp_zone}"]

  # node_count     = 3
  # node_count = var.gkeInitialNodeCount

  cluster            = google_container_cluster.tfer-gke.name
  initial_node_count = var.gkeInitialNodeCount
  location           = var.gcp_zone

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  max_pods_per_node = 110
  # name              = "default-pool"
  name = var.gkePoolName

  ##  network_config {
  ##    create_pod_range     = false
  ##    enable_private_nodes = false
  ##    pod_ipv4_cidr_block  = "10.24.0.0/14"
  ##    pod_range            = "gke-gke-pods-be6a9ca7"
  ##  }

  node_config {
    disk_size_gb    = 100
    disk_type       = "pd-balanced"
    image_type      = var.gkeImageType
    local_ssd_count = 0
    logging_variant = "DEFAULT"
    machine_type    = var.gkeMachineType

    metadata = {
      disable-legacy-endpoints = true
    }

    oauth_scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
    preemptible  = false

    resource_labels = {
      #      mesh_id = "proj-946522468759"
      mesh_id = var.gkeLabelMeshId
    }

    service_account = "default"

    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = false
    }

    spot = false

    #    workload_metadata_config {
    #      mode = "GKE_METADATA"
    #    }
  }

  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
    strategy        = "SURGE"
  }
}
