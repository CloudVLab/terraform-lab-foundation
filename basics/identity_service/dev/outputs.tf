## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------
output "wait_identity_delay" {
  value = time_sleep.wait_identity_delay.id
}

output "service_account_member" {
  value = google_project_service_identity.tlf[0].member
}
