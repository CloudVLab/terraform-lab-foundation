## https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance
resource "google_sql_database_instance" "mysql" {
  database_version = "MYSQL_5_7"
  name             = var.sql_db_name
  project          = var.gcp_project_id
  region           = var.gcp_region
  settings {
    disk_autoresize = true
    disk_size       = 100
    disk_type       = "PD_SSD"
    ip_configuration {
      authorized_networks {
        name  = "AS-1"
        value = "34.87.131.237/32"
      }
      authorized_networks {
        name  = "AS-10"
        value = "35.245.209.204/32"
      }
      authorized_networks {
        name  = "AS-11"
        value = "35.203.191.15/32"
      }
      authorized_networks {
        name  = "AS-12"
        value = "35.247.56.116/32"
      }
      authorized_networks {
        name  = "AS-13"
        value = "35.240.247.148/32"
      }
      authorized_networks {
        name  = "AS-14"
        value = "34.87.159.166/32"
      }
      authorized_networks {
        name  = "AS-15"
        value = "34.87.233.115/32"
      }
      authorized_networks {
        name  = "AS-16"
        value = "35.244.107.184/32"
      }
      authorized_networks {
        name  = "AS-17"
        value = "35.204.102.20/32"
      }
      authorized_networks {
        name  = "AS-18"
        value = "35.204.159.159/32"
      }
      authorized_networks {
        name  = "AS-19"
        value = "35.239.203.99/32"
      }
      authorized_networks {
        name  = "AS-2"
        value = "34.87.103.64/32"
      }
      authorized_networks {
        name  = "AS-20"
        value = "35.239.112.17/32"
      }
      authorized_networks {
        name  = "AS-21"
        value = "34.86.96.199/32"
      }
      authorized_networks {
        name  = "AS-22"
        value = "35.245.229.252/32"
      }
      authorized_networks {
        name  = "AS-23"
        value = "34.83.247.7/32"
      }
      authorized_networks {
        name  = "AS-24"
        value = "35.247.40.210/32"
      }
      authorized_networks {
        name  = "AS-3"
        value = "35.197.185.203/32"
      }
      authorized_networks {
        name  = "AS-4"
        value = "35.244.126.141/32"
      }
      authorized_networks {
        name  = "AS-5"
        value = "35.204.213.55/32"
      }
      authorized_networks {
        name  = "AS-6"
        value = "34.91.161.74/32"
      }
      authorized_networks {
        name  = "AS-7"
        value = "35.222.253.144/32"
      }
      authorized_networks {
        name  = "AS-8"
        value = "34.71.7.214/32"
      }
      authorized_networks {
        name  = "AS-9"
        value = "35.194.89.186/32"
      }
      ipv4_enabled = true
    }
    location_preference {
      zone = var.gcp_zone
    }
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
