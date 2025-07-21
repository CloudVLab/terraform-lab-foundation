# Custom Network
# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "dev_network" {
  name                    = var.vpc_network
  description             = var.vpc_network_description
  auto_create_subnetworks = false
  project                 = var.gcp_project_id
}

resource "time_sleep" "wait_vpc_delay" {
  create_duration = "60s"
  depends_on      = [google_compute_network.dev_network]
}
