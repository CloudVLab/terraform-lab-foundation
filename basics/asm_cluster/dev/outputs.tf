## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "gke_cluster_name" {
  value       = "${var.gke_cluster_name}"
  description = "Name of the GKE cluster"
}
