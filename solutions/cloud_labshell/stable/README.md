## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gceImageProject"></a> [gceImageProject](#input\_gceImageProject) | GCE machine image project | `string` | `"qwiklabs-resources"` | no |
| <a name="input_gceInstanceName"></a> [gceInstanceName](#input\_gceInstanceName) | Name of virtual machine. | `string` | `"cloudlearningservices"` | no |
| <a name="input_gceInstanceNetwork"></a> [gceInstanceNetwork](#input\_gceInstanceNetwork) | GCE virtual machine network | `string` | `"default"` | no |
| <a name="input_gceInstanceScope"></a> [gceInstanceScope](#input\_gceInstanceScope) | GCE service account scope | `list(string)` | <pre>[<br>  "cloud-platform"<br>]</pre> | no |
| <a name="input_gceInstanceTags"></a> [gceInstanceTags](#input\_gceInstanceTags) | GCE virtual machine tags | `list(string)` | <pre>[<br>  "lab-vm"<br>]</pre> | no |
| <a name="input_gceInstanceZone"></a> [gceInstanceZone](#input\_gceInstanceZone) | Zone to create resources in. | `string` | `"us-central1-f"` | no |
| <a name="input_gceMachineImage"></a> [gceMachineImage](#input\_gceMachineImage) | GCE virtual machine image family | `string` | `"test-labshell-cloud"` | no |
| <a name="input_gceMachineType"></a> [gceMachineType](#input\_gceMachineType) | Machine type to use for GCE | `string` | `"e2-standard-2"` | no |
| <a name="input_gce_startup_script"></a> [gce\_startup\_script](#input\_gce\_startup\_script) | GCE startup script | `string` | `"echo Welcome to Project Octopus > /tmp/octopus.txt"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_username"></a> [gcp\_username](#input\_gcp\_username) | Name of Qwiklabs user | `string` | `"tester"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gcrContainerImage"></a> [gcrContainerImage](#input\_gcrContainerImage) | Image to be run by Cloud Run | `string` | `"gcr.io/qwiklabs-resources/ide-proxy:latest"` | no |
| <a name="input_gcrImageBrowser"></a> [gcrImageBrowser](#input\_gcrImageBrowser) | Image to be run by Cloud Run | `string` | `"gcr.io/qwiklabs-resources/certdoc-proxy:latest"` | no |
| <a name="input_gcrPrimaryServiceName"></a> [gcrPrimaryServiceName](#input\_gcrPrimaryServiceName) | Name of service | `string` | `"labshell-service"` | no |
| <a name="input_gcrRegion"></a> [gcrRegion](#input\_gcrRegion) | Region to create resources in. | `string` | `"us-central1"` | no |
| <a name="input_vpcConnectorMachineType"></a> [vpcConnectorMachineType](#input\_vpcConnectorMachineType) | VPC Access Connector Machine Type | `string` | `"e2-micro"` | no |
| <a name="input_vpcFlowLogs"></a> [vpcFlowLogs](#input\_vpcFlowLogs) | VPC Flow Logs | `bool` | `false` | no |
| <a name="input_vpcPrivateGoogleAccess"></a> [vpcPrivateGoogleAccess](#input\_vpcPrivateGoogleAccess) | Enable IPv4 Private Google Access | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ideEditorService"></a> [ideEditorService](#output\_ideEditorService) | URL of the lab terminal service |
