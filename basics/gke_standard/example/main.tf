# GKE:    Google Kubernetes Engine 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Google Kubernetes Engine - Standard
module "la_gke_std" {
  #source = "github.com/CloudVLab/terraform-lab-foundation//basics/gke_standard/dev"
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/gke_standard/stable"

  # Pass values to the module
  gcp_project_id      = var.gcp_project_id
  gcp_region          = var.gcp_region
  gcp_zone            = var.gcp_zone

  # Customise the GKE cluster 
  gkeClusterName    = "test-cluster"
  gkeDescription    = "Lab Cluster"
  gkeNetwork        = "default"
  gkeSubnet         = "default"
}
