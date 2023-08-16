#
# ------------------ Module Definition 
#

# Solution: Generative AI environment 
# Local:  solutions/la_generative_ai/stable
# Remote: github//solutions/la_generative_ai/stable

module "la_generative_ai" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/la_generative_ai/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone
  gcp_user_id    = var.gcp_user_id

  # Set the source repository
  sme_git_repo = "https://github.com/CloudVLab/generative-ai.git" 
}

