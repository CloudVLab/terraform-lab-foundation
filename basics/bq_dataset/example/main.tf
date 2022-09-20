# Module: Google BigQuery Dataset 
module "la_bq_dataset" {
  ## NOTE: When changing the source parameter, `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory

  ## REMOTE: GitHub (Public) access - working 
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/bq_dataset/stable"
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/bq_dataset/stable?ref=tlf_bq"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/bq_dataset/stable"


  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCS instance
  bq_location = "US"
  bq_dataset_id = "dh"
  bq_dataset_friendly_name = "Data Hunt"
  bq_dataset_description = "Data Hunt Lab environment"
}
