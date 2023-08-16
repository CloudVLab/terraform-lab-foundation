module "la_cloud_run" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Cloud Run service
  gcrService = "genai-chatbot"
  gcrImage   = "gcr.io/qwiklabs-resources/arcade/arcade-frontend-chat"
  gcrRegion  = var.gcp_region 
}
