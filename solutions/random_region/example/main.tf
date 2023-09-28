# Solution: Random Region 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Random Region 
module "la_random_region" {
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/random_region/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Allowed Locations 
  gcp_allowed_locations = [ "us-central1", "us-east1", "us-east4", "us-west1" ]
}
