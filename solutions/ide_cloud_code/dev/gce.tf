## Create a Compute Instance 
## ----------------------------------------------------------------------------

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_instance
data "google_compute_image" "image_family" {
  family  = var.gceMachineImage
  project = var.gceProjectMachineImage 
}

# Module: Google Compute Engine
module "la_gce" {
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/dev"
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/stable"
  # source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/gce_instance/stable"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/gce_instance/dev"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCE instance
  gce_name            = var.gceInstanceName 
  gce_metadata        = null

  ## Family project override
  gce_machine_image      = data.google_compute_image.image_family.self_link
  gce_region             = var.gcp_region 
  gce_zone               = var.gcp_zone 
  gce_machine_type       = var.gceMachineType 
  gce_tags               = var.gceInstanceTags 
  gce_assign_external_ip = true 
  gce_machine_network    = module.la_vpc.vpc_subnetwork_name
  gce_startup_script     = "${file("./scripts/lab-init.sh")}"
  # gce_startup_script     = null
  # gce_scopes             = var.gceInstanceScope 
  # gce_service_account    = "default"
}

