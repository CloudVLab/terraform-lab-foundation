# Module: GoogleAPIs 
module "la_api_batch" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/api_service/dev"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Enable Google API(s) 
  api_services = [ "firebase.googleapis.com" ] 
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_project.html
resource "google_firebase_project" "default" {
    provider = google-beta
    project  = var.gcp_project_id 
    depends_on = [ module.la_api_batch ]
}
