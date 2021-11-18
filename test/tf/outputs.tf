## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "external_ip" {
  value       = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
  description = "External IP address of GCE instance"
}

output "gce_instance_name" {
  value       = "${var.vm_name}"
  description = "Name of the GCE instance"
}
