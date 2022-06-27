# ------------------ Module Definition 
#

# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Solution: IDE environment 
# Local:  modules/stable
# Remote: github.com/CloudVLab/terraform-lab-foundation//solutions/ide_web/stable

module "la_automl_proxy" {
  ## NOTE: When changing the `source` parameter
  ## `terraform init` is required

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/proxy_automl/dev"

  ## Exchange values between Qwiklabs and Module
  gcp_project_id  = var.gcp_project_id 
  gcp_region      = var.gcp_region 
  gcp_zone        = var.gcp_zone 

  ## Properties: AutoML Proxy 
  cr_env     =  [
    { gcr_env_name = "PROJECT_ID",      gcr_env_value = var.gcp_project_id },
    { gcr_env_name = "ENDPOINT_ID",     gcr_env_value = "4078176588351406080" },
    { gcr_env_name = "GATEWAY_URL",     gcr_env_value = "https://automl-gateway-kjyo252taq-uc.a.run.app/v1" },
    { gcr_env_name = "GATEWAY_PROJECT", gcr_env_value = "qwiklabs-resources" }
  ]

}

