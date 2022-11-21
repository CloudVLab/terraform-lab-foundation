resource "google_compute_instance" "gce_virtual_machine" {

  name           = var.gce_name
  machine_type   = var.gce_machine_type
  zone           = var.gcp_zone
  project        = var.gcp_project_id
  tags           = ["http-server"]
  can_ip_forward = var.gce_can_ip_forward

  boot_disk {
    initialize_params {
      image = var.gce_machine_image
    }
  }

  network_interface {
    network    = var.gce_machine_network == "default" ? var.gce_machine_network : null
    subnetwork = var.gce_machine_network == "default" ? null : var.gce_machine_network

    access_config {
      // Ephemeral IP
    }
  }

  # Add Key/Value pair e.g. SSH keys here
  metadata = {
    childProjectZone            = var.gcp_zone
    childProjectRegion          = var.gcp_region
    parentProject               = var.parentProject
    parentProjectStorageBucket  = var.parentProjectStorageBucket
    parentProjectDNSZone        = var.parentProjectDNSZone
    parentProjectSvcAccountPass = var.parentProjectSvcAccountPass
    parentProjectSourceRepo     = var.parentProjectSourceRepo
    parentProjectSourceBranch   = var.parentProjectSourceBranch
    parentProjectLabDirName     = var.parentProjectLabDirName
    parentProjectLabType        = var.parentProjectLabType
    createProdEnvironment       = var.createProdEnvironment
    startup-script-url          = var.startup_script_url
    childProjectUsername        = ""
    childProject                = var.gcp_project_id
    childProjectSvcAccountJSON  = base64decode(google_service_account_key.mykey.private_key)

  }
  # Override to perform startup script
  # metadata_startup_script = file("${path.module}/bootstrap-cloudlearning.sh")

  service_account {
    scopes = ["cloud-platform", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/logging.admin", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/trace.append", "https://www.googleapis.com/auth/devstorage.read_only"]
  }
  # depends_on = [local_file.foo]
  # depends_on = [time_sleep.wait_seconds]
}


data "google_service_account" "myaccount" {
  account_id = "${var.gcp_project_id}@${var.gcp_project_id}.iam.gserviceaccount.com"
}
output "qwiklabs_sva" {
  value = data.google_service_account.myaccount
}

# data "google_service_account_key" "private_key" {
#   service_account_id = data.google_service_account.myaccount.name
# }
# output "qwiklabs_private_key" {
#   value = data.google_service_account_key.private_key
# }

resource "google_service_account_key" "mykey" {
  service_account_id = "${var.gcp_project_id}@${var.gcp_project_id}.iam.gserviceaccount.com"
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
}

output "qwiklabs_private_key" {
  value     = base64decode(google_service_account_key.mykey.private_key)
  sensitive = true
}

resource "local_file" "foo" {
  content  = base64decode(google_service_account_key.mykey.private_key)
  filename = "${path.module}/service-account.json"
}

resource "time_sleep" "wait_seconds" {
  create_duration = "420s"
  depends_on      = [google_compute_instance.gce_virtual_machine]
}

// API Dependancies
resource "google_project_service" "service_networking_api" {
  project                    = var.gcp_project_id
  service                    = "servicenetworking.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "apigee_google_api" {
  project                    = var.gcp_project_id
  service                    = "apigee.googleapis.com"
  disable_dependent_services = true
}

// Runtime config which used to signal DM waiter
resource "google_runtimeconfig_config" "my-runtime-config" {
  provider    = google-beta
  name        = "lab-startup-config"
  project     = var.gcp_project_id
  description = "Runtime configuration values for runtime service"
}

data "google_runtimeconfig_config" "my-config" {
  provider    = google-beta
  name        = "lab-startup-config"
  project     = var.gcp_project_id
}
output "lab-config" {
  value = data.google_runtimeconfig_config.my-config.name
}
#
# resource "null_resource" "wait_for_signal" {
#   provisioner "local-exec" {
#     command = <<-EOT
#       until [ $(gcloud beta runtime-config configs variables set success/lab-startup success --config-name lab-startup-config --project ${var.gcp_project_id}) -lt 404 ]; do
#           sleep 15
#       done
#     EOT
#   }
# }