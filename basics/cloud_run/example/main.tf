# GCR:    Cloud Run 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Cloud Run 
module "la_cloud_run" {
  #source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable?ref=tlf-basics"
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable/v1"
  # source = "gcs::https://storage.googleapis.com/terraform-lab-foundation/basics/cloud_run/stable"
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCE instance
  gcrRegion  = var.gcp_region 
  #gcrService = "automl-proxy"
  #gcrImage   = "gcr.io/qwiklabs-resources/ide-proxy:latest"
  #gcrEnvs    = [ { "URL", "https://storage.googleapis.com/spl-api/test2.json" } ]
}
