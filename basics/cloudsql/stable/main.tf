## https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance
resource "google_sql_database_instance" "mysql" {
  # TODO: Set this option as a variable
  database_version = "MYSQL_5_7"
  name             = var.sql_db_name
  project          = var.gcp_project_id
  region           = var.gcp_region
  settings {
    disk_autoresize = true
    disk_size       = 100
    disk_type       = "PD_SSD"
    location_preference {
      zone = var.gcp_zone
    }
    # TODO: Set this option as a variable
    tier = "db-custom-1-3840"
  }

  # Leave this as false so it can be deleted with Student project
  deletion_protection = "false"
}

## https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database
## Ensure the Database has a unique name to prevent database name clash.
resource "google_sql_database" "database" {
  name     = "${var.gcp_project_id}-${var.sql_db_name}"
  instance = google_sql_database_instance.mysql.name
}

## https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user
resource "google_sql_user" "users" {
  name     = var.sql_user_name 
  instance = google_sql_database_instance.mysql.name
  host     = var.sql_user_host 
  password = var.sql_user_password 
}
