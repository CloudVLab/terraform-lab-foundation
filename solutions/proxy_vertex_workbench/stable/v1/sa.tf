# Create Service Account and Bind Role
module "la_role_bind" {
  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/iam_role_bind/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region 
  gcp_zone       = var.gcp_zone 

  ## Custom Properties
  iam_sa_name        = "vertex-ai" 
  iam_sa_description = "Vertex Lab Service Account" 
  iam_role           = "roles/editor"
}
