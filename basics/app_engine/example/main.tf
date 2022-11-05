# App Engine:    App Engine + Cloud Database
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: App Engine + Cloud Firestore
module "la_gae_database" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/app_engine/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GAE instance
  gae_location    = "us-central" 
  gae_hasDatabase = false 
  # gae_db_type     = "CLOUD_FIRESTORE"
}
