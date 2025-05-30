provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
  version = "4.3.0"
}

## provider "google-beta" {
##   project = var.gcp_project_id
##   region  = var.gcp_region
##   zone    = var.gcp_zone
##   version = "4.3.0"
## }
