# GSR:    Source Repository 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Source Repo 
module "la_repo" {
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/source_repo/stable?ref=tlf_gsr"
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/source_repo/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Source Repository
  gsr_name       = "my-repo"
}
