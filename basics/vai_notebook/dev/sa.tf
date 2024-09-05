## # Reference
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
#
resource "google_service_account" "service_account" {
  account_id   = "vertex-ai"
  display_name = "Vertex AI Service Account"
}
