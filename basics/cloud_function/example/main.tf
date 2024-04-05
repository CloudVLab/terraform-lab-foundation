# Cloud Functions:   
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Locals: Variables
# ----------------------------------------------------------------------------
# Set the Cloud Function properties
locals {
  cloud_function_name         = "myfunction"
  cloud_function_description  = "Test Cloud Function"
  cloud_function_runtime      = "nodejs16"
  cloud_function_entrypoint   = "httpHello"
  cloud_function_object       = "function.zip"
  cloud_function_path         = "./cf/"
  cloud_function_bucket_ext   = "mybucket"
}

# Module: Cloud Functions
module "la_gcf" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_function/stable"

  # Pass values to the module
  gcp_project_id       = var.gcp_project_id
  gcp_region           = var.gcp_region
  gcp_zone             = var.gcp_zone

  # Customise the Cloud Storage
  gcs_bucket_extension = "bucket"

  # Customise the Cloud Function
  gcf_name                  = "${local.cloud_function_name}"
  gcf_description           = "${local.cloud_function_description}"
  gcf_runtime               = "${local.cloud_function_runtime}"
  gcf_target_bucket         = "${local.cloud_function_bucket_ext}"
  gcf_archive_source        = "${local.cloud_function_path}${local.cloud_function_object}"
  gcf_archive_object        = "${local.cloud_function_object}"
  gcf_entry_point           = "${local.cloud_function_entrypoint}"
  gcf_environment_variables = {
    PROJECT_ID = var.gcp_project_id
  }
}
