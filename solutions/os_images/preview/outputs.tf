# solutions/os_images/preview/outputs.tf

output "os_images" {
  description = "A map of all configured OS images."
  value       = local.os_images
}

output "centos" {
  description = "CentOS OS image details."
  value       = local.os_images.centos
}

output "debian" {
  description = "Debian OS image details."
  value       = local.os_images.debian
}

output "ubuntu" {
  description = "Ubuntu OS image details."
  value       = local.os_images.ubuntu
}

output "windows" {
  description = "Windows Server OS image details."
  value       = local.os_images.windows
}
