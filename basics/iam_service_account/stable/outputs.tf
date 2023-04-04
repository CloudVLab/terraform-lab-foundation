## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "iam_service_account" {
  value       = "${google_service_account.custom_sa.account_id}"
  description = "Name of the Service Account to be created"
}
