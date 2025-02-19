# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform
#


##---------------------------------------------------------------------------
## Container Cluster: Separate Managed Node Pool Example

# GKE cluster
resource "google_container_cluster" "primary" {
#  provider = google-beta
  name     = var.gke_cluster_name
  location = var.gke_location
  
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  # Monitoring Service
  #monitoring_config {
  #  monitoring_service = "monitoring.googleapis.com/kubernetes"
  #  enable_components  = "SYSTEM_COMPONENTS"
  #}

  # Enable this section to use Istio AddOn
  # addons_config {
  #   istio_config {
  #     disabled = var.istio_disabled 
  #     auth     = var.istio_auth
  #   }
  # }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.gke_location
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = var.gke_scopes 

    labels = {
      env = var.gke_cluster_name
    }

    # preemptible  = true
    machine_type = var.gke_machine_type
    # tags         = var.gke_tags 
    tags         = ["gke-vm", "${var.gke_cluster_name}"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
