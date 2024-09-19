# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service_identity

resource "google_project_service_identity" "tlf" {
  provider = google-beta

  # Original config:
  # project = data.google_project.project.project_id
  # service = "healthcare.googleapis.com"

  ## https://developer.hashicorp.com/terraform/language/functions/toset
  ## Removes duplicates
  for_each = toset(var.identity_services)

  project = var.gcp_project_id 
  service = each.key
}

# Introduce a JIT delay for API enablement
## Add a Delay before creating a Workbench instance
resource "time_sleep" "wait_identity_delay" {
  create_duration = var.identity_create_duration 
  depends_on = [ google_project_service_identity.tlf ]
}
