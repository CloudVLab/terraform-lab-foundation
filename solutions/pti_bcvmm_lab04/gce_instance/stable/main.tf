# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
#

resource "google_compute_instance" "gce_virtual_machine" {

  name         = var.gce_name
  machine_type = var.gce_machine_type
  zone         = var.gcp_zone
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
    # network            = "source-db-net"
    # subnetwork         = "source-db-subnet"
    subnetwork_project = var.gcp_project_id

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
    ## email = var.gce_service_account == "default" ? null : var.gce_service_account
    scopes = var.gce_scopes
  }
#   provisioner "remote-exec" {
#   connection {
#     type     = "ssh"
#     user     = var.username
#     private_key = var.ssh_pvt_key
#     host     = self.network_interface.0.access_config.0.nat_ip
#   }
#   script = "scripts/lab-init.sh"
# }
}
