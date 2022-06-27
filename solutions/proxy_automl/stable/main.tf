# ------------------ AutoML Proxy: Vertex Workbench Notebook 
# ------------------ Module Definition 
#

##----------------------------------------------------------------------------
## Example: AutoML Endpoint
##
## Enable Secret Manager Googleapis
## Add AutoML EndpointId to Secret Manager
## Add AutoML ProjectId  to Secret Manager
##----------------------------------------------------------------------------

# API Service:   Enable GoogleAPIs 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Google Compute Engine
module "la_api_secret_manager" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCE instance
  api_service_name = "secretmanager.googleapis.com"  
}

# Module: AutoML  
module "la_automl" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  ## Add Environment Variables
  gcrEnvs        = var.cr_env

  # Customise the GCE instance
  gcrService     = var.cr_service_name
  gcrImage       = var.cr_image 
  #gcrRegion     = var.cr_region 
}
