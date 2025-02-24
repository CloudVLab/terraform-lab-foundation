# Cloud Functions:   
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Cloud Functions
module "la_gcf" {
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_function_g2/stable/v1"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/cloud_function_g2/stable/v1"

  # Pass values to the module
  gcp_project_id       = var.gcp_project_id
  gcp_region           = var.gcp_region
  gcp_zone             = var.gcp_zone

  # Customise the Cloud Storage
  gcs_bucket_extension = "bucket"

  # Customise the Cloud Function
  gcf_name             = "myfunction"
  gcf_description      = "Test Cloud Function"
  gcf_runtime          = "nodejs20"
  gcf_target_bucket    = "mybucket"
  gcf_local_source     = "./cf/function.zip"
  gcf_entry_point      = "httpHello"
}
