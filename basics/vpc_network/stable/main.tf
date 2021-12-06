# Custom Network
# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "dev_network" {
  name                    = var.vpc_network 
  description             = var.vpc_network_description 
  auto_create_subnetworks = false
  project                 = var.gcp_project_id
}

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "dev_subnet" {
  name          = var.vpc_subnet 
  ip_cidr_range = var.vpc_subnet_cidr 
  region        = var.vpc_region
  network       = google_compute_network.dev_network.id
  project       = var.gcp_project_id
}
