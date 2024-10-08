## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------
output "wait_identity_delay" {
  value = time_sleep.wait_identity_delay.id
  description = "Custom delay for API to be enabled"
}

output "service_account_emails" {
  value = { for k, v in google_project_service_identity.tlf : k => v.member }
  description = "Map of service names to their corresponding service account emails"
}

## output "service_account_member" {
##   value = google_project_service_identity.tlf[tolist(google_project_service_identity.tlf)[0]].member
##   description = "Service identity member service account"
## }
