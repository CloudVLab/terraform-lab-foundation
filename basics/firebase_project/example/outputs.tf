## Expose Firebase Project properties

# Terraform Output values
output "firebase_project_id" {
  value = module.la_firebase_project.firebase_project_id
}

output "firebase_project_number" {
  value = module.la_firebase_project.firebase_project_number
}
