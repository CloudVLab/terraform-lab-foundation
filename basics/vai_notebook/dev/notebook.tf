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
  dynamic "network_interfaces" {
    for_each = var.vai_machine_network != null || var.vai_machine_subnet != null ? [1] : []
    content {
      network    = var.vai_machine_network
      subnet     = var.vai_machine_subnet
    }
  }

  labels = {
    host = "vertexai_notebook"
  }

  vm_image {
    project      = var.vai_machine_image
    image_family = var.vai_image_family
  }

  # Startup-script
  post_startup_script = var.vai_post_startup_script

#  depends_on = [google_project_service.notebooks-api]
}
