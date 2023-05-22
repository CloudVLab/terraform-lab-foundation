## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "gke_cluster_name" {
  value       = module.la_asm_cluster.gke_cluster_name
  description = "Name of the GKE cluster"
}