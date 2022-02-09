# ------------------ IDE: Integrated Development Environment   
# ------------------ Module Definition 
#

# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Solution: IDE environment 
# Local:  modules/stable
# Remote: github.com/CloudVLab/terraform-lab-foundation//solutions/ide_tensorflow/stable


# Solution: IDE environment 
# Local:  modules/tf
# Remote: github//TBC
# Output Value(s):
# - ideEditorService  : URL of IDE Service
# - ideBrowserService : URL of Browser Service
# - ideInstanceName   : URL of Browser Service

module "la_ide" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## Module subdirectory needs to be defined within the TF directory
  source = "./solutions/ide_tensorflow/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id  = var.gcp_project_id 
  gcp_region      = var.gcp_region 
  gcp_zone        = var.gcp_zone 
  gcp_username    = var.qlUsername

  ## Properties: GCE 
  # gceMachineImage    = var.qlMachineImage
  gceMachineImage    = "tensorflow-codeserver" 
  # gceMachineImage    = "r-4-1-vertex-custom" 
  # gceMachineName     = "cloudlearningservices" 
  # gceInstanceZone    = "us-central1-f"
  # gceInstanceTags    = ["lab-vm"]
  # gceMachineType     = "e2-standard-2"
  # gceInstanceScope   = ["cloud-platform"] 

  ## Properties: Cloud Run
  # gcrRegion          = "us-central1"
  #gce_startup_script  = "${file("./scripts/lab-init")}"
}

