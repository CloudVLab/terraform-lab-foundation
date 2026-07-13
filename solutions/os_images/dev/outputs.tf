# solutions/os_images/dev/outputs.tf

output "os_images" {
  description = "A map of all configured OS images."
  value       = local.os_images
}

output "debian" {
  description = "Debian OS image details."
  value       = local.os_images.debian
}

output "ubuntu" {
  description = "Ubuntu OS image details."
  value       = local.os_images.ubuntu
}
