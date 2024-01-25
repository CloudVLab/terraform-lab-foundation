## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "gkeClusterName" {
  value       = google_container_cluster.tfer-gke.name
  description = "Name of the GKE instance"
}
