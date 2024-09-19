# API Service:   Enable Service Identity
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Enable Service Identity 
module "la_service_identity" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/identity_service/dev"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise module properties 
  identity_services = [ "compute.googleapis.com" ] # APIs to enable 
  identity_create_duration = "60s"                 # API enable delay
}
