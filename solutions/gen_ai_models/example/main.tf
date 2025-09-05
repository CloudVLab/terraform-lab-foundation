#
# ------------------ Module Definition 
#

# Solution: FraudFinder environment 
# Local:  solutions/gen_ai_models/stable
# Remote: github//solutions/gen_ai_models/stable

module "gen_ai_models" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/gen_ai_models/stable"
}
