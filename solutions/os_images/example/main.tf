#
# ------------------ Module Definition 
#

# Solution: OS Images environment 
# Local:  solutions/os_images/stable
# Remote: github//solutions/os_images/stable

module "os_images" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/os_images/stable"
}
