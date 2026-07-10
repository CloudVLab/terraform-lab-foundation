# solutions/node/preview/outputs.tf

output "node" {
  description = "A map of all available node details."
  value       = local.node
}
