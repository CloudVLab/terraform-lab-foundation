## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------
output "wait_identity_delay" {
  value = time_sleep.wait_identity_delay.id
  description = "Custom delay for API to be enabled"
}

output "service_account_member" {
  value = tolist(google_project_service_identity.tlf)[0].member
  description = "Service identity member service account"
}
