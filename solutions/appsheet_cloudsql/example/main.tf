# Module: Google CloudSQL 
module "la_gce" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCE instance
  gce_name            = "mysql-admin"
  gce_tags            = ["lab-vm"]
  gce_machine_image   = "debian-cloud/debian-11"
  gce_machine_network = "default"
  gce_scopes          = ["cloud-platform"]
  gce_startup_script  = "${file("./scripts/lab-init")}"

  # Create the CloudSQL instance
  depends_on = [ module.la_cloudsql]
}

module "la_cloudsql" {
  ## NOTE: When changing the source parameter, `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  #source = "./basics/cloudsql/stable"

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/appsheet_cloudsql/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCS instance
  #sql_user_name  = "lab_tester"
  #sql_db_name    = "appsheet" 
  #sql_db_version = "MYSQL_5_7"
  #sql_user_host  = "%"
  #sql_user_password = var.tfPassword 
  sql_user_password = "Password01" 
}
