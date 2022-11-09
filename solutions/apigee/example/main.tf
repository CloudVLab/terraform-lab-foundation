# module "apigee_org" {
#   # source = "github.com/SureSkills/terraform-lab-foundation//basics/apigee_organisation/stable"
#   source = "./solutions//apigee/dev"

#   # Pass values to the module
#   gcp_project_id = var.gcp_project_id
#   gcp_region     = var.gcp_region
#   gcp_zone       = var.gcp_zone

# }

module "gce_instance" {
  source = "./custom/gce_instance/stable"
  # source = "github.com/SureSkills/terraform-lab-foundation//basics/apigee_organisation/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone
  # depends_on     = []
}
