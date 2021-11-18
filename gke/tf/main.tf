# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform
#
resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}

##---------------------------------------------------------------------------
## Container Cluster: Default Node Pool Example

# GKE cluster
resource "google_container_cluster" "primary" {
  provider = google-beta
  name     = "${var.cluster_name}"
  location = "${var.gcp_region}"
  
  #network     = var.machine_network 
  #network    = google_compute_network.vpc.name
  #subnetwork = google_compute_subnetwork.subnet.name

  initial_node_count = var.gke_num_nodes

  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      foo = "bar"
    }
    tags = ["foo", "bar"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }

  #private_cluster_config {
  #  enable_private_endpoint = false
  #  enable_private_nodes    = true
  #  master_ipv4_cidr_block  = var.gke_master_ipv4_cidr_block
  #}

  # Enable GKE Autopilot
  # enable_autopilot = false


  # Release channel GKE
  release_channel {
    channel = "STABLE"
  }

  # Enable this section to use Istio AddOn
  # addons_config {
  #   istio_config {
  #     disabled = "${var.istio_disabled}" 
  #     auth     = "${var.istio_auth}"
  #   }
  # }
}
