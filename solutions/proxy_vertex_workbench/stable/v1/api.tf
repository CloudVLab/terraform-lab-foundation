# Important:  
# ----------------------------------------------------------------------------
## Introduce a JIT delay for API enablement 
## Add a Delay before creating a Workbench instance

resource "time_sleep" "wait_api_delay" {
  depends_on      = [ module.la_api_batch.api_services ]
  create_duration = "60s"
}


## API Service module
# ----------------------------------------------------------------------------
module "la_api_batch" {
  ## source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/dev"
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/stable/v1"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCE instance
  api_services = [ "iam.googleapis.com", "compute.googleapis.com", "containerregistry.googleapis.com", "aiplatform.googleapis.com", "cloudbuild.googleapis.com", "notebooks.googleapis.com", "vpcaccess.googleapis.com", "run.googleapis.com", "notebooks.googleapis.com" ]
}

