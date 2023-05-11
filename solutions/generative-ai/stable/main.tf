/*
  Get GCP project number (int)
*/

data "google_project" "project" {}

/*
  Enable Required APIs
*/

variable "gcp_service_list" {
  description = "The list of apis necessary for the project"
  type        = list(string)
  default = [
    "aiplatform.googleapis.com",
    "artifactregistry.googleapis.com",
    "bigquery.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "containerregistry.googleapis.com",
    # "dataflow.googleapis.com",
    "iam.googleapis.com",
    "notebooks.googleapis.com",
    # "pubsub.googleapis.com",
    # "run.googleapis.com",
  ]
}

resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)
  project  = var.gcp_project_id
  service  = each.key
}


/*
  Random Generator
*/

resource "random_string" "rand" {
  length  = 5
  special = false
  lower   = true
  upper   = false
}

/*
  Set local variables
*/

locals {
  ID                                = random_string.rand.result
  NOTEBOOK_LOG                      = "/tmp/notebook_config.log"
  compute_service_account_email     = "${data.google_project.project.number}-compute@developer.gserviceaccount.com"
  cloud_build_service_account_email = "${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

/*
  Create GCP Storage Bucket
  Set storage admin on bucket to SA and Lab user
*/

resource "google_storage_bucket" "generative_ai_bucket" {
  name          = "${var.gcp_project_id}-generative-ai"
  location      = var.gcp_region
  force_destroy = true
}

resource "google_storage_bucket" "lab_config_bucket" {
  name          = "${var.gcp_project_id}-labconfig-bucket"
  location      = var.gcp_region
  force_destroy = true
}

/*
  Create config scripts & upload to buckets
*/

resource "local_file" "notebook_config" {

  content = <<EOF
echo "Current user: `id`" >> ${local.NOTEBOOK_LOG} 2>&1
echo "Changing dir to /home/jupyter" >> ${local.NOTEBOOK_LOG} 2>&1
cd /home/jupyter
echo "Cloning generative-ai from github" >> ${local.NOTEBOOK_LOG} 2>&1
su - jupyter -c "git clone https://github.com/GoogleCloudPlatform/generative-ai.git" >> ${local.NOTEBOOK_LOG} 2>&1
echo "Current user: `id`" >> ${local.NOTEBOOK_LOG} 2>&1
echo "Installing python packages" >> ${local.NOTEBOOK_LOG} 2&1
su - jupyter -c "pip install --upgrade --no-warn-conflicts --no-warn-script-location --user \
    google-cloud-bigquery \
    google-cloud-pipeline-components \
    google-cloud-aiplatform \
    seaborn \
    kfp" >> ${local.NOTEBOOK_LOG} 2>&1

EOF

  filename = "notebook_config.sh"
}

resource "google_storage_bucket_object" "notebook_config_script" {
  name   = "notebook_config.sh"
  source = "notebook_config.sh"
  bucket = google_storage_bucket.lab_config_bucket.name
  depends_on = [
    google_storage_bucket.lab_config_bucket,
    local_file.notebook_config
  ]
}

/*
  Create Vertex AI Notebook
*/

resource "google_notebooks_instance" "genai_notebook" {
  name               = "generative-ai-jupyterlab"
  project            = var.gcp_project_id
  location           = var.gcp_zone
  machine_type       = "n1-standard-4" 
  install_gpu_driver = false
  vm_image { // https://cloud.google.com/vertex-ai/docs/workbench/user-managed/images
    project      = "deeplearning-platform-release"
    image_family = "tf-ent-2-11-cu113-notebooks-debian-11-py310"
  }

  post_startup_script = "gs://${var.gcp_project_id}-labconfig-bucket/notebook_config.sh"
  
  depends_on = [google_project_service.gcp_services, google_storage_bucket_object.notebook_config_script]
}

/*
  Assign Appropriate IAM Permissions to the compute SA
*/

variable "compute_service_account_project_iam_list" {
  description = "Roles needed for compute SA"
  type        = list(string)
  default = [
    "roles/aiplatform.admin",
    "roles/artifactregistry.admin",
    "roles/bigquery.admin",
    "roles/cloudbuild.builds.editor",
    "roles/cloudbuild.integrations.editor",
    # "roles/cloudfunctions.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/notebooks.admin",
    # "roles/pubsub.admin",
    "roles/resourcemanager.projectIamAdmin",
    "roles/storage.admin",
  ]
}

resource "google_project_iam_member" "servacct-compute-add-permissions" {
  for_each = toset(var.compute_service_account_project_iam_list)
  project  = var.gcp_project_id
  role     = each.key
  member   = "serviceAccount:${local.compute_service_account_email}"
}

/*
  Assign Appropriate IAM Permissions to the Cloud Build SA
*/
        
# variable "cloud_build_service_account_project_iam_list" {
#   description = "Roles needed for compute SA"
#   type        = list(string)
#   default = [
#     "roles/run.admin",
#     "roles/cloudbuild.serviceAgent",
#     "roles/aiplatform.admin",
#     "roles/cloudbuild.builds.editor",
#     "roles/cloudbuild.integrations.editor",
#     "roles/iam.serviceAccountAdmin",
#   ]
# }

# resource "google_project_iam_member" "servacct-cloud-build-add-permissions" {
#   for_each = toset(var.cloud_build_service_account_project_iam_list)
#   project  = var.gcp_project_id
#   role     = each.key
#   member   = "serviceAccount:${local.cloud_build_service_account_email}"
#   depends_on = [google_notebooks_instance.genai_notebook]
# }
