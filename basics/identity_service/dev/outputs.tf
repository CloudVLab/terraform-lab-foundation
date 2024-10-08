## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------
output "wait_identity_delay" {
  value = time_sleep.wait_identity_delay.id
  description = "Custom delay for API to be enabled"
}

output "service_account_emails" {
  value = { for k, v in google_project_service_identity.tlf : k => v.member }
  description = "Map of service names key to their corresponding service account property value"
}
