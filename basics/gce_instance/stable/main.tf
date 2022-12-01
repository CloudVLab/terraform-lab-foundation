# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
#

resource "google_compute_instance" "gce_virtual_machine" {

  name         = var.gce_name
  machine_type = var.gce_machine_type
  zone         = var.gce_zone ? var.gce_zone : var.gcp_zone
  project      = var.gcp_project_id

  tags           = var.gce_tags
  can_ip_forward = var.gce_can_ip_forward

  boot_disk {
    initialize_params {
      image = var.gce_machine_image
    }
  }

  network_interface {
    network = var.gce_machine_network == "default" ? var.gce_machine_network : null
    subnetwork = var.gce_machine_network == "default" ? null : var.gce_machine_network

    access_config {
      // Ephemeral IP
    }
  }

  # Add Key/Value pair e.g. SSH keys here
  metadata = var.gce_metadata ? var.gce_metadata : null


  # Override to perform startup script
  metadata_startup_script = var.gce_startup_script ? var.gce_startup_script : null 

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # email  = google_service_account.default.email
    email = var.gce_service_account ? var.gce_service_account : null
    scopes = var.gce_scopes
  }
}
