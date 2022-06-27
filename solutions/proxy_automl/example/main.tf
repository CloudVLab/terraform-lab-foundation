# ------------------ Module Definition 

#

# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: AutoML  
module "la_automl_proxy" {
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/proxy_automl/main"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  ## --------------------------------------------------------------
  ## AutoML Proxy - Cloud Run Service  
  ## Default: Use Environment Variables
  ## --------------------------------------------------------------

  ## Add Environment Variables
  ## Consult Docs to add required settings
  cr_env      = [
    { gcr_env_name = "XXXXXXXX", gcr_env_value = "YYYYYYYYY" }
  ]

}
