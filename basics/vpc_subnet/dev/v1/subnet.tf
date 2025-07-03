# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "dev_subnet" {
  name          = var.vpc_subnet 
  ip_cidr_range = var.vpc_subnet_cidr 
  region        = var.vpc_region
  network       = google_compute_network.dev_network.id
  project       = var.gcp_project_id
  private_ip_google_access = var.vpc_private_google_access

##   log_config    {
##     aggregation_interval = "INTERVAL_10_MIN"
##     flow_sampling        = 0.5
##     metadata             = "INCLUDE_ALL_METADATA"
##   }

  # Give network time to be created
  # depends_on = [ time_sleep.wait_vpc_delay ]
}
