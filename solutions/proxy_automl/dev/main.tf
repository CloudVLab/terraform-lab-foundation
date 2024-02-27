# ------------------ AutoML Proxy: Vertex Workbench Notebook 
# ------------------ Module Definition 
#

# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Solution: AutoML Proxy 
# Local:  modules/stable
# Remote: github.com/CloudVLab/terraform-lab-foundation//solutions/proxy_automl/stable

##----------------------------------------------------------------------------
## Example: AutoML Endpoint
##
## Enable Secret Manager Googleapis
## Add AutoML EndpointId to Secret Manager
## Add AutoML ProjectId  to Secret Manager
##----------------------------------------------------------------------------

# API Service:   Enable GoogleAPIs 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Google Compute Engine
## module "la_api_secret_manager" {
##   source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/stable"
## 
##   # Pass values to the module
##   gcp_project_id = var.gcp_project_id
##   gcp_region     = var.gcp_region
##   gcp_zone       = var.gcp_zone
## 
##   # Customise the GCE instance
##   api_service_name = "secretmanager.googleapis.com"  
## }

##   gcp_region      = var.gcp_region 
##   gcp_zone        = var.gcp_zone 
## 
##   ## Properties: GCE 
##   ## Ref: https://cloud.google.com/vertex-ai/docs/workbench/user-managed/images
##   #gceInstanceImage    = "tf-latest-cpu" 
##   gceInstanceImage    = "common-cpu-notebooks-debian-11" 
##   gceImageProject     = "deeplearning-platform-release"
##   # gceInstanceName     = "cloudlearningservices" 
##   # gceInstanceZone     = "us-central1-f"
##   # gceInstanceTags     = ["lab-vm"]
##   # gceMachineType      = "e2-standard-2"
##   # gceInstanceScope    = ["cloud-platform"]
## 
##   ## Properties: Cloud Run
##   # gcrServiceName      = "workbench-service"
##   # gcrRegion           = "us-central1"
##   # gcrImagePrimary     = "gcr.io/qwiklabs-resources/notebook-proxy:latest"
##   # gcrGoogleService    = "run.googleapis.com"
##   # gcrRolePermission   = "roles/run.invoker"
##   # gcrMemberPermission = "allUsers"
##   # gcrRegion           = "us-central1"
## }

##----------------------------------------------------------------------------
## Example: AutoML Endpoint
##
## Enable Secret Manager Googleapis
## Add AutoML EndpointId to Secret Manager
## Add AutoML ProjectId  to Secret Manager
##----------------------------------------------------------------------------

# API Service:   Enable GoogleAPIs 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Google Compute Engine
module "la_api_secret_manager" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCE instance
  api_service_name = "secretmanager.googleapis.com"  
}

# Secret Manager:  Create Secret Manager message 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

## # Module: Secret Manager 
## module "la_automl_endpointid" {
##   source = "github.com/CloudVLab/terraform-lab-foundation//basics/secret_manager/stable"
## 
##   # Pass values to the module
##   gcp_project_id = var.gcp_project_id
##   gcp_region     = var.gcp_region
##   gcp_zone       = var.gcp_zone
## 
##   # Customise the GCE instance
##   secret_manager_identifier = "endpointid"
##   secret_manager_label      = "automl-endpoint"
##   secret_manager_data       = "4078176588351406080"
## 
##   # Ensure the API has been enabled
##   depends_on = [ module.la_api_secret_manager]  
## }
## 
## # Module: Secret Manager 
## module "la_automl_projectid" {
##   source = "github.com/CloudVLab/terraform-lab-foundation//basics/secret_manager/stable"
## 
##   # Pass values to the module
##   gcp_project_id = var.gcp_project_id
##   gcp_region     = var.gcp_region
##   gcp_zone       = var.gcp_zone
## 
##   # Customise the GCE instance
##   secret_manager_identifier = "projectid"
##   secret_manager_label      = "remote-project-id"
##   secret_manager_data       = "qwiklabs-resources"
## 
##   # Ensure the API has been enabled
##   depends_on = [ module.la_api_secret_manager]  
## }
## 
## # Module: Secret Manager 
## module "la_automl_gatewayurl" {
##   source = "github.com/CloudVLab/terraform-lab-foundation//basics/secret_manager/stable"
## 
##   # Pass values to the module
##   gcp_project_id = var.gcp_project_id
##   gcp_region     = var.gcp_region
##   gcp_zone       = var.gcp_zone
## 
##   # Customise the GCE instance
##   secret_manager_identifier = "gatewayurl"
##   secret_manager_label      = "automl-gateway"
##   secret_manager_data       = "https://automl-gateway-kjyo252taq-uc.a.run.app/v1"
## 
##   # Ensure the API has been enabled
##   depends_on = [ module.la_api_secret_manager]  
## }

# Module: AutoML  
module "la_automl" {
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable?ref=tlf-basics"
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  ## Add Environment Variables
  gcrEnvs        = var.cr_env

  # Customise the GCE instance
  gcrService     = var.cr_service_name
  gcrImage       = var.cr_image 
  #gcrRegion     = var.cr_region 
}
