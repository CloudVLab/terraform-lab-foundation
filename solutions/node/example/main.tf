#
# ------------------ Module Definition 
#

# Solution: node environment 
# Local:  solutions/node/stable
# Remote: github//solutions/node/stable

module "node" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/node/stable"
}
