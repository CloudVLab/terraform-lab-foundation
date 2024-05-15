## Googleapis 
## ----------------------------------------------------------------------------

# Module: Enable Google APIs
module "la_api_batch" {
  ## source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/stable/v1"
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/dev"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the APIs
  api_services = [ "vpcaccess.googleapis.com", "run.googleapis.com" ] 
}

