# Module: Google Compute Engine

module "la_gce" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/dev"
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCE instance
  gce_name            = "cls-vm" 
  gce_metadata        = null
  gce_startup_script  = null

  ## Family project override
  gce_machine_image   = data.google_compute_image.image_family.self_link
  gce_region          = var.gcp_region 
  gce_zone            = var.gcp_zone 
  gce_machine_type    = var.gceMachineType 
  gce_tags            = ["lab-vm"] 
  gce_machine_network = module.la_vpc.vpc_subnetwork_name

  gce_assign_external_ip = false 
  #gce_machine_network    = google_compute_subnetwork.dev_subnet.name
  #gce_scopes             = ["cloud-platform"] 
  #gce_service_account    = "default"
  #gce_startup_script     = "${file("./scripts/lab-init")}"
}

## Create a Compute Instance 
## ----------------------------------------------------------------------------

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_instance
data "google_compute_image" "image_family" {
  family  = var.gceMachineImage
  project = "qwiklabs-resources"
}
