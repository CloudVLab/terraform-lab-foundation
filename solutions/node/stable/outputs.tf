# solutions/node/stable/outputs.tf

output "node" {
  description = "Node.js runtime details for this channel."
  value       = local.node
}
