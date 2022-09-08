# Basics: IAM Role Binding 
# Local:  basics/iam_role_bind/dev
# Remote: github//basics/iam_role_bind/stable

module "la_role_bind" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## https://www.terraform.io/language/modules/sources#selecting-a-revision
  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  ## source = "./basics/iam_role_bind/stable"

  ## REMOTE: GitHub (Public) access - working 
  ## source = "github.com/CloudVLab/terraform-lab-foundation//basics/iam_role_bind/dev?ref=tlf_iam"

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/iam_role_bind/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region 
  gcp_zone       = var.gcp_zone 

  ## Custom Properties
  # Pass reference to the student username
  iam_user           = var.tfUser_0
  iam_sa_name        = "sa_name"
  iam_sa_description = "sa description" 
  iam_role           = "roles/viewer"
}
