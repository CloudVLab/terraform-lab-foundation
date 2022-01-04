# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
#

resource "google_compute_instance" "gce_virtual_machine" {

  name         = var.gce_name
  machine_type = var.gce_machine_type
  zone         = var.gcp_zone
  project      = var.gcp_project_id

  tags = var.gce_tags

  boot_disk {
    initialize_params {
      image = var.gce_machine_image
    }
  }

  network_interface {
    #network = var.gce_machine_network
    subnetwork = var.gce_machine_network

    access_config {
      // Ephemeral IP
    }
  }

  # Add Key/Value pair e.g. SSH keys here
  # metadata = {
  #  foo = "bar"
  # }

  # Override to perform startup script
  metadata_startup_script = var.gce_startup_script 

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # email  = google_service_account.default.email
    scopes = var.gce_scopes
  }
}
