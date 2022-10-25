## Expose GCE properties

# Terraform Output values
output "gce_external_ip" {
  value = module.la_gce.gce_external_ip
}

output "gce_instance_name" {
  value = module.la_gce.gce_instance_name
}

