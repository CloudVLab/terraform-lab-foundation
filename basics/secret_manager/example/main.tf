# Secret Manager:  Create Secret Manager message 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Secret Manager 
module "la_secret_manager" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/secret_manager/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCE instance
  secret_manager_identifier = "lab-identifier"
  secret_manager_label      = "lab-label"
  secret_manager_data       = "lab-data"
}
