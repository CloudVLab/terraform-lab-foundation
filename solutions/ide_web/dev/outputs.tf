## --------------------------------------------------------------
## Custom variable defintions
## --------------------------------------------------------------

output "ideEditorService" {
  value       = "${google_cloud_run_service.ide.status[0].url}"
  description = "URL of the IDE service"
}

output "ideBrowserService" {
  value       = "${google_cloud_run_service.browser.status[0].url}"
  description = "URL of the Browser service"
}

output "ideInstanceName" {
  value       = "${var.gceInstanceName}"
  description = "Name of the GCE instance"
}

output "vpcNetworkName" {
  value       = "${module.la_vpc.vpc_network_name}"
  description = "Name of the GCE instance"
}
