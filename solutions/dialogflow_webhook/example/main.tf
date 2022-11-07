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

