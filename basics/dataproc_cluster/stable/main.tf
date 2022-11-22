# resource "google_service_account" "default" {
#  account_id   = "service-account-id"
#  display_name = "Service Account"
# }

resource "google_dataproc_cluster" "mycluster" {
  name     = "dataproc-cluster"
  region   = var.gcp_region
  graceful_decommission_timeout = "120s"

  cluster_config {
    staging_bucket = "${var.gcp_project_id}"-staging

    master_config {
      num_instances = 1
      machine_type  = var.machine_type
      disk_config {
        boot_disk_type    = "pd-ssd"
        boot_disk_size_gb = 30
      }
    }

    worker_config {
      num_instances    = 2
      machine_type     = var.machine_type
      disk_config {
        boot_disk_size_gb = 30
        num_local_ssds    = 1
      }
    }

    preemptible_worker_config {
      num_instances = 0
    }

    # Override or set some custom properties
    software_config {
      image_version = "2.0-debian10"
      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
      }
    }

    gce_cluster_config {
      tags = [ "hadoopaccess" ]
      # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
      # service_account = google_service_account.default.email
      service_account_scopes = [
        "cloud-platform"
      ]
    }

    # You can define multiple initialization_action blocks
    initialization_action {
      script      = var.init_script
      timeout_sec = 500
    }
  }
}
