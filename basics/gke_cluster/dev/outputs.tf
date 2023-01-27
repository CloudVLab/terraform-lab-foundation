## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "gke_instance_name" {
  value       = "${var.gkeClusterName}"
  description = "Name of the GKE instance"
}
