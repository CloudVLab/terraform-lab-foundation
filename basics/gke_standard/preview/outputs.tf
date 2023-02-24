## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

output "gkeName" {
  value       = "${var.gkeClusterName}"
  description = "Name of the GKE instance"
}
