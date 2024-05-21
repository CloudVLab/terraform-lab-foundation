## --------------------------------------------------------------
## Output variable definitions - Override from Custom Properties
## --------------------------------------------------------------

output "workbench_proxy_uri" {
  value = google_workbench_instance.instance.proxy_uri
}

output "workbench_name" {
    value        = "${var.vai_workbench_name}"
      description = "Vertex Workbench name."
}
