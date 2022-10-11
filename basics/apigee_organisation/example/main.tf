# Module: Apigee Organisation
#Apigee_org
module "apigee_org" {
  source   = "github.com/SureSkills/terraform-lab-foundation//basics/apigee_organisation/stable"
  # source = "./custom/apigee/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone
}
