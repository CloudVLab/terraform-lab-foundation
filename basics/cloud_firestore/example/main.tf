# App Engine:    App Engine + Cloud Database
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: App Engine + Cloud Firestore
module "la_gae_firestore" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_firestore/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GAE instance
  gae_location    = "us-central" 
  gae_hasDatabase = true 
  gae_db_type     = "CLOUD_FIRESTORE"
}
