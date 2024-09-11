# GKE:    Google Kubernetes Engine 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Google Kubernetes Engine - Autopilot 
module "la_gke_autopilot" {
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/gke_autopilot/stable"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/gke_autopilot/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GKE cluster 
  gkeClusterName      = "my-cluster"
  gkeDescription      = "Lab Kubernetes Cluster"
  gkeNetwork          = "default"
  gkeSubnetwork       = "default"
  gkeIsCustomNetwork  = false
}
