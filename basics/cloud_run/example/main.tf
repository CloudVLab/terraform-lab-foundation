# GCR:    Cloud Run 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: AutoML  
module "la_cloud_run" {
  #source = "github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/stable?ref=tlf-basics"
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCE instance
  #gcrService = "automl-proxy"
  #gcrImage   = "gcr.io/qwiklabs-resources/ide-proxy:latest"
  #gcrRegion  = "us-central1"
}
