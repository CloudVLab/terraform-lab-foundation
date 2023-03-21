# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
#

resource "google_compute_instance" "gce_virtual_machine" {

  name         = var.gce_name
  machine_type = var.gce_machine_type
  zone         = var.gce_zone == null ? var.gcp_zone : var.gce_zone
  project      = var.gcp_project_id

  tags           = var.gce_tags
  can_ip_forward = var.gce_can_ip_forward

  boot_disk {
    # Set the Boot disk name to the name of the VM
    device_name = var.gce_name
    initialize_params {
      image = var.gce_machine_image
      size  = var.gce_disk_size 
      type  = var.gce_disk_type
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
  metadata = var.gce_metadata == null ? null : var.gce_metadata


  # Override to perform startup script
  metadata_startup_script = var.gce_startup_script == null ? null : var.gce_startup_script 

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # email  = google_service_account.default.email
    email = var.gce_service_account == null ? null : var.gce_service_account
    scopes = var.gce_scopes
  }
}
