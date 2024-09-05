# Basics: Vertex AI Workbench 
# Local:  basics/vai_workbench/stable
# Remote: github//basics/vai_workbench/stable

module "la_vai_workbench" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  # source = "./basics/vai_workbench/stable"

  ## REMOTE: GitHub (Public) access - working 
  ## source = "github.com/CloudVLab/terraform-lab-foundation//basics/vai_workbench/stable"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/vai_workbench/stable/v1"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region 
  gcp_zone       = var.gcp_zone 

  ## Custom Properties
  # vai_workbench_name = "custom-notebook-name" 
  # vai_post_startup_script = "gs://[bucket]/[LAB_ID]/lab-init.sh"
}
