# ------------------ IDE: Integrated Development Environment   
# ------------------ Module Definition 
#

# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Solution: Cloud LabShell environment 

module "la_labshell" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## Module subdirectory needs to be defined within the TF directory
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/cloud_labshell/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id  = var.gcp_project_id 
  gcp_region      = var.gcp_region 
  gcp_zone        = var.gcp_zone 

  ## Properties: GCE 

  ## Properties: Cloud Run
  # gcrRegion          = var.gcp_region 
  # gce_startup_script  = "${file("./scripts/lab-init")}"
}

