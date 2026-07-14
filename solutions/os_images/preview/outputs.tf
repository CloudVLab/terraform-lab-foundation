# solutions/os_images/preview/outputs.tf

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

output "ubuntu_2204" {
  description = "Ubuntu 22.04 LTS OS image details."
  value       = local.os_images.ubuntu_2204
}

output "ubuntu_2004" {
  description = "Ubuntu 20.04 LTS OS image details."
  value       = local.os_images.ubuntu_2004
}

output "ubuntu_2404_minimal" {
  description = "Ubuntu Minimal 24.04 LTS OS image details."
  value       = local.os_images.ubuntu_2404_minimal
}

output "ubuntu_2404_arm64" {
  description = "Ubuntu 24.04 LTS (ARM64) OS image details."
  value       = local.os_images.ubuntu_2404_arm64
}

output "ubuntu_1804" {
  description = "Ubuntu 18.04 LTS OS image details."
  value       = local.os_images.ubuntu_1804
}

output "ubuntu_1604" {
  description = "Ubuntu 16.04 LTS OS image details."
  value       = local.os_images.ubuntu_1604
}

output "centos_7" {
  description = "CentOS 7 OS image details."
  value       = local.os_images.centos_7
}

output "centos_7_v20201014" {
  description = "CentOS 7 (v20201014) OS image details."
  value       = local.os_images.centos_7_v20201014
}

output "centos_stream_9" {
  description = "CentOS Stream 9 OS image details."
  value       = local.os_images.centos_stream_9
}
