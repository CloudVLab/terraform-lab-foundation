## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "gce_external_ip" {
  value       = "${google_compute_instance.gce_virtual_machine.network_interface.0.access_config.0.nat_ip}"
  description = "External IP address of GCE instance"
}

output "gce_instance_name" {
  value       = "${var.gce_name}"
  description = "Name of the GCE instance"
}
