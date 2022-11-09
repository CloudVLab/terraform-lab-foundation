module "gce_instance" {
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/apigee/dev"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone
  # depends_on     = []
}
