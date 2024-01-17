# Generic Activity Tracking

## Use Case: Pass Activity Tracking

If you just want to include `pass` placeholder within a lab, use the following link.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| N/A | N/A | Demo a `pass` activity within a lab | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/pass_step_check) |


## Use Case: Service Exists Activity Tracking

If you are spinning up a resource, it can be helpful to check the existence within a project.
Use the Terraform scripts below to validate a resource exists with generic activity tracking code.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| BigQuery | get_dataset | Check if a `dataset` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/bq_dataset_create) |
| Cloud Storage | get_bucket | Check if a `storage bucket` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/gcs_bucket_create) |
| Compute | get_firewall | Check if a `firewall rule` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/fw_rule_create) |
| Logging | get_sink | Check if a `log sink` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/log_sink_create) |
| PubSub | get_topic | Check if a `Topic` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/pubsub_topic_create) |
| PubSub | get_subscription | Check if a `Subscription` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/pubsub_sub_create) |
| Source Repo | get_repo | Check if a `Repository` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/source_repo_create) |
| Compute | get_network | Check if a `network` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/vpc_network_create) |
| Compute | get_subnetwork | Check if a `subnetwork` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/vpc_subnet_create) |


## Setup

1. Amend the `variables.tf` file to set the name the `step` to be generated.


```terraform
variable "step_name" {
  type        = string
  description = "The name of the step to be created"
  default     = "bigquery_dataset_check"
}
```

__Note:__ The Terraform `default` value will determine the name of:

- [ ] The file to be generated
- [ ] The name of the method to be created

## Generate

To generate the file, use Terraform to create the output file.

1. Initialise the folder 
```
terraform init
```

2. Validate the code
```
terraform validate
```

3. Create the activity tracking code file
```
terraform apply -auto-approve
```

4. Optional: To remove the file created
```
terraform destroy -auto-approve
```
