# Module: Cloud Run Gen v2 
module "la_cloud_run_v2" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable/v2"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Custom Properties
  gcrNetworkName = module.la_vpc.vpc_network_name 
  gcrSubnetName  = module.la_vpc.vpc_subnetwork_name
  gcrServiceEgress = "ALL_TRAFFIC"
  gcrServiceName  = "workbench-proxy"
  gcrServiceImage = "gcr.io/qwiklabs-resources/workbench-proxy:latest"
  # gcrInstanceTags = [ "tagMe" ]
  # gcrServiceImage = "Cloud Run Service IMAGE"
}
