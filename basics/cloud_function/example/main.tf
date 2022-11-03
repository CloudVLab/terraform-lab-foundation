# Cloud Functions:   
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Cloud Functions
module "la_gcf" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_function/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Cloud Function
  gcf_name          = "myfunction"
  gcf_description   = "Test Cloud Function"
  gcf_runtime       = "nodejs16"
  gcf_target_bucket = "mybucket"
  gcf_local_source  = "./cf/function.zip"
  gcf_entry_point   = "httpHello"
  
}
