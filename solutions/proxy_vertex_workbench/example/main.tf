# ------------------ Proxy: Vertex Notebook 
# Output Value(s):
# - vertex_notebook_url: URL of Browser Service

module "la_vertex_workbench" {
  ## source = "github.com/CloudVLab/terraform-lab-foundation//solutions/proxy_vertex_workbench/stable/v1"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/solutions/proxy_vertex_workbench/stable/v1"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id  = var.gcp_project_id 
  gcp_region      = var.gcp_region 
  gcp_zone        = var.gcp_zone 

  ## Properties: GCE 
  ## https://cloud.google.com/vertex-ai/docs/workbench/user-managed/images
  ## gcePostStartupScript = "https://storage.googleapis.com/spls/[LAB_ID]/lab-init.sh"
}
