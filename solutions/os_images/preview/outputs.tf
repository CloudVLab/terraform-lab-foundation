# solutions/os_images/preview/outputs.tf

output "os_images" {
  description = "A map of all configured OS images."
  value       = local.os_images
}

output "debian" {
  description = "Debian OS image details."
  value       = local.os_images.debian
}
