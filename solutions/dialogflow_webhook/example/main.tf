#
# ------------------ Module Definition 
#

# Solution: Dialogflow Webhook 
# Local:  solutions/dialogflow_webhook/stable
# Remote: github//solutions/dialogflow_webhook/stable

module "la_df_webhook" {
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/dialogflow_webhook/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone
}

# Module: Cloud Functions
module "la_gcf_mp" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_function/stable"

  # Pass values to the module
  gcp_project_id       = var.gcp_project_id
  gcp_region           = var.gcp_region
  gcp_zone             = var.gcp_zone

  # Customise the Cloud Storage
  gcs_bucket_extension = "mp"

  # Customise the Cloud Function
  gcf_name             = "cloudioGetMostPlayed"
  gcf_entry_point      = "mostPlayed"
  gcf_description      = "Most Played Cloud Function"
  gcf_runtime          = "nodejs16"
  gcf_archive_object   = "mostplayed.zip"
  gcf_archive_source   = "./cf/mostplayed.zip"
}

# Module: Cloud Functions
module "la_gcf_ac" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_function/stable"

  # Pass values to the module
  gcp_project_id       = var.gcp_project_id
  gcp_region           = var.gcp_region
  gcp_zone             = var.gcp_zone

  # Customise the Cloud Storage
  gcs_bucket_extension = "ac"

  # Customise the Cloud Function
  gcf_name             = "cloudioAccountUpdate"
  gcf_entry_point      = "accountUpdate"
  gcf_description      = "Accounts Cloud Function"
  gcf_runtime          = "nodejs16"
  gcf_archive_object   = "account.zip"
  gcf_archive_source   = "./cf/account.zip"
}
