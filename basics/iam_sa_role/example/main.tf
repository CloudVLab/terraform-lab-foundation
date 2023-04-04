# Basics: IAM Service Account Role 
# Local:  basics/iam_sa_role/dev
# Remote: github//basics/iam_sa_role/stable

module "la_sa_role" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## https://www.terraform.io/language/modules/sources#selecting-a-revision
  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  ## source = "./basics/iam_sa_role/stable"

  ## REMOTE: GitHub (Public) access - working 
  ## source = "github.com/CloudVLab/terraform-lab-foundation//basics/iam_sa_role/dev?ref=tlf_iam"

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/iam_sa_role/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region 
  gcp_zone       = var.gcp_zone 

  ## Custom Properties
  # Pass reference to the student username
  iam_sa_name  = "test-sa" 
  iam_sa_roles = ["roles/viewer"] 
}
