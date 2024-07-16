# GCR:    Cloud Run 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Cloud Run 
# v1: Generation 1
# v2: Generation 2
module "la_cloud_run" {
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable"
  # source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/cloud_run/stable/v2"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/cloud_run/stable/v1"

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
