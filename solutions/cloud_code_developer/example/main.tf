# ------------------ Cloud Code Developer Module: Integrated Development Environment   
# ------------------ Module Definition 
#

# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Solution: IDE environment 
# Local:  modules/stable
# Remote: gcs::https://storage.googleapis.com/github.com/terraform-lab-foundation/solutions/cloud_code_developer/stable
# Remote: github.com/CloudVLab/terraform-lab-foundation//solutions/cloud_code_developer/stable
# Remote: github.com/CloudVLab/terraform-lab-foundation//solutions/cloud_code_developer/beta
# Remote: github.com/CloudVLab/terraform-lab-foundation//solutions/cloud_code_developer/dev

# Output Value(s):
# - service_url:            URL of IDE Service
# - live_service_url:       URL of Browser Proxy Service
# - resource_instance_name: Name of the GCE instance

module "la_ccd" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  #source = "./solutions/ide_cloud_code/stable"

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/cloud_code_developer/stable"
  ## source = "gcs::https://storage.googleapis.com/terraform-lab-foundation/solutions/cloud_code_developer/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id     = var.gcp_project_id 
  gcp_region         = var.gcp_region 
  gcp_zone           = var.gcp_zone 

  ## Properties: GCE 
  gceStartup         = "echo Hello"
  # "${file("./scripts/lab-init")}"
}

