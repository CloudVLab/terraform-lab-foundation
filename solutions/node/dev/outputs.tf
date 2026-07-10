# solutions/node/dev/outputs.tf

output "node" {
  description = "A map of all available node details."
  value       = local.node
}
