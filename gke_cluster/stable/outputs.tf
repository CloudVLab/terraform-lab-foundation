## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "gke_instance_name" {
  value       = "${var.gke_cluster_name}"
  description = "Name of the GKE instance"
}
