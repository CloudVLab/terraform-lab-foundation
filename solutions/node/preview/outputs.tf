# solutions/node/preview/outputs.tf

output "node" {
  description = "Node.js runtime details for this channel."
  value       = local.node
}
