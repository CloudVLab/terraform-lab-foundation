# GKE:    Google Kubernetes Engine Node Pool
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Google Kubernetes Engine Node Pool - Standard
module "la_gke_node_pool" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/gke_node_pool/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GKE cluster 
  gkeClusterName = "test-cluster"
}
