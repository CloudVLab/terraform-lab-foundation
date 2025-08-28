#
# ------------------ Module Definition 
#

# Solution: FraudFinder environment 
# Local:  solutions/fraudfinder/stable
# Remote: github//solutions/fraudfinder/stable

module "gen_ai_models" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/gen_ai_models/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone
  gcp_user_id    = var.gcp_user_id
}
