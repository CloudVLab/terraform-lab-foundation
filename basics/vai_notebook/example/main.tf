# Basics: Vertex AI Notebook
# Local:  basics/vai_notebook/stable
# Remote: github//basics/vai_notebook/stable

module "la_vai_notebook" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  # source = "./basics/vai_notebook/stable"

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/vai_notebook/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region 
  gcp_zone       = var.gcp_zone 

  ## Custom Properties
  # vai_notebook_name = "custom-notebook-name" 
  vai_region        = var.gcp_region
  vai_zone          = var.gcp_zone
  # vai_post_startup_script = "gs://[bucket]/[LAB_ID]/lab-init.sh"

}
