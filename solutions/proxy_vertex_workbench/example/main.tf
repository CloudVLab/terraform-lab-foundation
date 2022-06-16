# ------------------ Proxy: Vertex Notebook 
# ------------------ Module Definition 
#

# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Solution: IDE environment 
# Local:  modules/stable
# Remote: github.com/CloudVLab/terraform-lab-foundation//solutions/proxy_vertex_workbench/stable

# Output Value(s):
# - vertex_notebook_url: URL of Browser Service

module "la_vertex_workbench" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  #source = "./solutions/vertex_proxy_workbench/dev"

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/proxy_vertex_workbench/stable"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id  = var.gcp_project_id 
  gcp_region      = var.gcp_region 
  gcp_zone        = var.gcp_zone 

  ## Properties: GCE 
  ## https://cloud.google.com/vertex-ai/docs/workbench/user-managed/images
  ## gcePostStartupScript = "https://storage.googleapis.com/spls/[LAB_ID]/lab-init.sh"
}

