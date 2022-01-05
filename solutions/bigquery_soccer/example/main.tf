#
# ------------------ Module Definition 
#

# Solution: BigQuery environment 
# Local:  solutions/bigquery_soccer/stable
# Remote: github//solutions/bigquery_soccer/stable

module "la_bigquery_soccer" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  #source = "./solutions/bigquery_soccer/stable"

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/bigquery_soccer/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id  = var.gcp_project_id 
  gcp_region      = var.gcp_region 
  gcp_zone        = var.gcp_zone 
}

