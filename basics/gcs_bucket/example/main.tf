# Module: Google Cloud Storage
module "la_gcs" {
  ## NOTE: When changing the source parameter, `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  #source = "./basics/gcs_bucket/stable"

  ## REMOTE: GitHub (Public) access - working 
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/gcs_bucket/stable"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/gcs_bucket/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCS instance
  gcs_bucket_extension = "bucket" 
  gcs_storage_class    = "STANDARD"
  gcs_append_project   = true 
}
