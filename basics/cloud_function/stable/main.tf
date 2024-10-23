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
  name = var.gcf_archive_object
  #name   = "mostplayed.zip" 
  bucket = google_storage_bucket.bucket.name
  source = var.gcf_archive_source
  #source = "./cf/mostplayed.zip" 

  depends_on = [google_storage_bucket.bucket]
}

#
## Cloud Functions 
#-----------------------------------------------------------------------------
#
## NEW Module: Cloud Function

resource "google_cloudfunctions_function" "custom_function" {
  name        = var.gcf_name
  project     = var.gcp_project_id
  region      = var.gcp_region
  description = var.gcf_description
  runtime     = var.gcf_runtime

  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  entry_point           = var.gcf_entry_point

  available_memory_mb = var.gcf_available_mb

  # b/374612344 - Gen 1 set to CR as default 
  docker_registry              = var.gcf_registry
  timeout                      = var.gcf_timeout
  trigger_http                 = var.gcf_trigger_http
  https_trigger_security_level = var.gcf_trigger_security
  environment_variables        = var.gcf_environment_variables

  # b/374612344 - Gen 1 uses appspot as service SA + compute dev as Build SA
  service_account_email = var.gcf_service_account_email == null ? null : var.gcf_service_account_email

  depends_on = [google_storage_bucket_object.archive]
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
