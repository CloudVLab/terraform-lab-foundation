# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
#

resource "google_compute_instance" "default" {

  name         = "${var.vm_name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.vm_zone}"

  tags = "${var.vm_tags}"

  boot_disk {
    initialize_params {
      image = "${var.machine_image}"
    }
  }

  network_interface {
    network = "${var.machine_network}"

    access_config {
      // Ephemeral IP
    }
  }

  # Add Key/Value pair e.g. SSH keys here
  # metadata = {
  #  foo = "bar"
  # }

  metadata_startup_script = "echo Welcome to Octopus > /tmp/octopus.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # email  = google_service_account.default.email
    scopes = "${var.vm_scopes}"
  }
}
