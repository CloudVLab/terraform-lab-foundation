## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------
## output "secret_id" {
##   value       = "${google_secret_manager_secret.lab-secret.id}"
##   description = "Secret manager identifier"
## }


output "secret_id" {
  value = "google_secret_manager_secret_version.lab-data.secret"
}
