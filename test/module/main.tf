module "la_gce" {
  #source = "./tf"
  #source = "https://storage.googleapis.com/qwiklabs-lab-architect-rosera/terraform-testing/gce-terraform.zip"
  source = "gcs::https://www.googleapis.com/storage/v1/qwiklabs-lab-architect-rosera/terraform-testing/gce-terraform.zip"
  #gcp_project_id = var.gcp_project_id
  #gcp_region = var.gcp_region
  #gcp_zone   = var.gcp_zone
  #vm_name    = var.vm_name
  #username   = var.username
}
