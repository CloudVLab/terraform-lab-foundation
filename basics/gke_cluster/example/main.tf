# GCE:    Virtual Machine
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Google Compute Engine
module "la_gce" {
  #source = "github.com/CloudVLab/terraform-lab-foundation//basics/gke_cluster/dev"
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/gke_cluster/stable"

  # Pass values to the module
  gcp_project_id      = var.gcp_project_id
  gcp_region          = var.gcp_region
  gcp_zone            = var.gcp_zone

  # Customise the GKE cluster 
  gke_cluster_name    = "test-cluster"
  gke_location        = var.gcp_zone
  gke_machine_type    = "e2-standard-2"
  gke_num_nodes       = 2 
}
