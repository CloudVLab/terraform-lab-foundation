# Custom Firewall
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "allow-rule-network" {
  name          = var.fwr_name 
  network       = var.fwr_network
  source_ranges = var.fwr_source_range
  direction     = var.fwr_direction
  project       = var.gcp_project_id

  # Enable INGRESS
  allow {
    protocol    = var.fwr_protocol
    ports       = var.fwr_ports
  }

  # Apply the rule to target_tags
  # source_tags = ["lab-vm"]
  # target_tags = ["lab-vm"]

  # depends_on = [google_compute_network.dev_network]
}
