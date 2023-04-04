## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "iam_service_account" {
  value       = "module.la_sa.iam_service_account"
  description = "Name of the Service Account to be created"
}
