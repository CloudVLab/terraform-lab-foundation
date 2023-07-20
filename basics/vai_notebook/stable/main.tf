# Enable the notebooks service
resource "google_project_service" "notebooks-api" {
  project = var.gcp_project_id
  service = "notebooks.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  # disable_dependent_services = true
}

# Enable the ap platform api
resource "google_project_service" "aiplatform-api" {
  project = var.gcp_project_id
  service = "aiplatform.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  # disable_dependent_services = true
}

# Reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
#
resource "google_service_account" "service_account" {
  account_id   = "vertex-ai"
  display_name = "Vertex AI Service Account"
}


# Reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
# Authorative for a given role.
## resource "google_project_iam_binding" "vertex_viewer_bind" {
##   role    = "roles/viewer"
##   project = var.gcp_project_id
##   members = [
##     "serviceAccount:vertex-ai@${var.gcp_project_id}.iam.gserviceaccount.com",
##   ]
##   depends_on = [google_service_account.service_account]
## }

resource "google_project_iam_member" "vertex_viewer_bind" {
  role       = "roles/viewer"
  project    = var.gcp_project_id
  member     = "serviceAccount:vertex-ai@${var.gcp_project_id}.iam.gserviceaccount.com"
  depends_on = [google_service_account.service_account]
}

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/notebooks_instance
#
resource "google_notebooks_instance" "vertex_instance" {
  name         = var.vai_notebook_name
  location     = var.gcp_zone
  machine_type = var.vai_machine_type
  tags         = var.vai_tags

  #instance_owners = [ "$var.vai_username" ]

  install_gpu_driver = false
  no_public_ip = var.vai_no_public_access 
  # Set no_proxy_access = true to use SSH Port Forward
  no_proxy_access = var.vai_no_proxy_access 

  #  network = google_compute_network.dev_network.id
  #  subnet = google_compute_subnetwork.ml_subnet.id

  labels = {
    host = "vertexai_notebook"
  }

  vm_image {
    project      = var.vai_machine_image
    image_family = var.vai_image_family
  }

  # Startup-script
  post_startup_script = var.vai_post_startup_script

  depends_on = [google_project_service.notebooks-api]
}
