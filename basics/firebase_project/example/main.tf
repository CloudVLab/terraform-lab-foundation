# Firebase: Project 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Google Compute Engine
module "la_firebase_project" {
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/firebase_project/stable"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/firebase_project/stable/v1"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone
}
