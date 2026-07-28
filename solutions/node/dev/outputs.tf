# solutions/node/dev/outputs.tf

output "node" {
  description = "Node.js runtime details for this channel."
  value       = local.node
}
