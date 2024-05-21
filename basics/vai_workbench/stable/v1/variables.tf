variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to create resources in."
}

# Default value passed in
variable "gcp_region" {
  type        = string
  description = "Region to create resources in."
}

# Default value passed in
variable "gcp_zone" {
  type        = string
  description = "Zone to create resources in."
}

## --------------------------------------------------------------
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------

# Expected custom_properties key to be declared in `qwiklabs.yaml`
# with the same name for any lab that uses this script.
variable "vai_workbench_name" {
  type        = string
  description = "Vertex VM instance name."
  default     = "cloudlearningservices"
}

# Custom properties with defaults
variable "vai_machine_type" {
  type        = string
  description = "Machine type to use for GCE"
  default     = "e2-medium"
}

# Custom properties with defaults
variable "vai_accelerator_type" {
  type        = string
  # Cannot use accelerator with E series machine type
  description = "Accelerator type for machine Type"
  # Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workbench_instance#type
  # default     = "NVIDIA_TESLA_T4"
  default     = null
}

# Custom properties with defaults
variable "vai_tags" {
  type        = list(string)
  description = " Vertex Workbench virtual machine tags"
  default     = [ "tlf", "cls", "lab-vm" ]
}

# Custom properties with defaults
variable "vai_machine_network" {
  type        = string
  description = "GCE virtual machine network"
  default     = null
}

# Custom properties with defaults
variable "vai_machine_subnet" {
  type        = string
  description = "GCE virtual machine network"
  default     = "default"
}

# Custom properties with defaults
variable "vai_network_nic_type" {
  type        = string
  description = "Network Interface Card type"
  default     = "VIRTIO_NET"
}

# Custom properties with defaults
variable "vai_network_stack_type" {
  type        = string
  description = "Network stack IPV4 or IPV6"
  default     = "IPV4_ONLY"
}

# Custom properties with defaults
variable "vai_post_startup_script" {
  type        = string
  description = "Path to a bash script to execute"
  default     = "https://storage.googleapis.com/spls/tlf-workbench/lab-init.sh"
  ## default     = "https://storage.googleapis.com/spls/tlf-workbench/workbench-lab-init.sh"
}

# Custom properties with defaults
variable "vai_disable_public_ip" {
  type        = bool
  description = "Disable the public IP for the workbench"
  default     = false
}

# Custom properties with defaults
variable "vai_disable_proxy_access" {
  type        = bool
  description = "Allow proxy access via SSH"
  default     = true
}

# Custom properties with defaults
variable "vai_enable_ip_forwarding" {
  type        = bool
  description = "IP forward"
  default     = true
}
