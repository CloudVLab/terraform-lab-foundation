# ------------------ Module Definition 
#

# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: AutoML  
module "la_automl_proxy" {
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/proxy_automl/stable"

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
    { gcr_env_name = "PROJECT_ID",      gcr_env_value = var.gcp_project_id },
    { gcr_env_name = "REGION_ID",       gcr_env_value = var.gcp_region },
    { gcr_env_name = "ENDPOINT_ID",     gcr_env_value = var.endpoint_id },
    { gcr_env_name = "GATEWAY_URL",     gcr_env_value = var.gateway_url },
    { gcr_env_name = "GATEWAY_PROJECT", gcr_env_value = var.gateway_project }
  ]

}
