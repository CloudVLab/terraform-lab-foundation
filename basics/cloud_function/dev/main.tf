#
## Cloud Storage 
#-----------------------------------------------------------------------------
#
### CALL: Cloud Storage Module

resource "google_storage_bucket" "bucket" {
  name                        = "${var.gcp_project_id}-${var.gcs_bucket_extension}"
  location                    = var.gcp_region
  project                     = var.gcp_project_id
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "archive" {
  name   = var.gcf_archive_object
  bucket = google_storage_bucket.bucket.name
  source = var.gcf_archive_source

  depends_on = [google_storage_bucket.bucket]
}

#
## Cloud Functions 
#-----------------------------------------------------------------------------
#
## NEW Module: Cloud Function

data "google_project" "project" {
  project_id = var.gcp_project_id
}

locals {
  #  PROJECT_NUMBER-compute@developer.gserviceaccount.com
  service_account = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
}

resource "google_cloudfunctions_function" "custom_function" {
  name        = var.gcf_name
  project     = var.gcp_project_id
  region      = var.gcp_region
  description = var.gcf_description
  runtime     = var.gcf_runtime

  ## source_archive_bucket = var.gcf_target_bucket 
  ## source_archive_object = var.gcf_archive_source
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  entry_point           = var.gcf_entry_point

  ## Ref: CR/AF Migration 
  available_memory_mb = var.gcf_available_mb
  # docker_registry              = var.gcf_registry
  timeout                      = var.gcf_timeout
  trigger_http                 = var.gcf_trigger_http
  https_trigger_security_level = var.gcf_trigger_security
  environment_variables        = var.gcf_environment_variables

  # b/374612344 - Gen 1 uses appspot as service SA + compute dev as Build SA
  service_account_email = local.service_account
  depends_on            = [google_storage_bucket_object.archive]
}

#
## IAM Cloud Functions
#-----------------------------------------------------------------------------
#
## CALL IAM to apply role to member
## CALL: IAM Module 

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = var.gcp_project_id
  region         = var.gcp_region
  cloud_function = google_cloudfunctions_function.custom_function.name
  role           = var.gcf_role_bind
  member         = var.gcf_member_account
}
