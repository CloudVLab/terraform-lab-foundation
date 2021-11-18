# Reference:
# VPC
# Set the VPC name

resource "google_compute_network" "vpc" {
  # name                  = "${var.gcp_project_id}-vpc"
  name                    = "${var.network_name}"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  # name        = "${var.gcp_project_id}-subnet"
  name          = "${var.network_name}-subnet" 
  region        = "${var.gcp_region}"
  network       = google_compute_network.vpc.id
  ip_cidr_range = "${var.subnet_range}"
}
