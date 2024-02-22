# Generic Activity Tracking

If you are spinning up a resource, it can be helpful to check the existence within a project.
Use the Terraform scripts below to validate a resource exists with generic activity tracking code.


## Use Case: Pass Activity Tracking

* Problem: I want to include activity tracking functionality
* Solution: Include a `pass` placeholder within a lab. When the user clicks on the activity tracking it will turn green to mimic a pass.
* Discussion: The code linked below provides an example setup.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| N/A | N/A | Demo a `pass` activity within a lab | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/pass_step_check) |


## Use Case: BigQuery 

### BigQuery Dataset

* Problem: I want validate a dataset has been created.
* Solution: Include the `get_dataset` method to perform this action.
* Discussion: The code linked below provides an example setup.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| BigQuery | get_dataset | Check if a `dataset` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/bq_dataset_create) |


### BigQuery Table

* Problem: I want validate a table has been created.
* Solution: Include the `get_table` method to perform this action.
* Discussion: The code linked below provides an example setup.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| BigQuery | get_table | Check if a `table` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/bq_table_create) |


## Use Case: Cloud Storage 

### Cloud Storage Bucket 

* Problem: I want validate a bucket has been created.
* Solution: Include the `get_bucket` method to perform this action.
* Discussion: The code linked below provides an example setup.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| Cloud Storage | get_bucket | Check if a `storage bucket` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/gcs_bucket_create) |

## Use Case: Logging 

### Logging Sink 

* Problem: I want validate a sink has been created.
* Solution: Include the `get_sink` method to perform this action.
* Discussion: The code linked below provides an example setup.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| Logging | get_sink | Check if a `log sink` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/log_sink_create) |

## Use Case: PubSub 

### PubSub Topic

* Problem: I want validate a PubSub Topic has been created.
* Solution: Include the `get_topic` method to perform this action.
* Discussion: The code linked below provides an example setup.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| PubSub | get_topic | Check if a `Topic` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/pubsub_topic_create) |

### PubSub Subscription 

* Problem: I want validate a PubSub Subscription has been created.
* Solution: Include the `get_subscription` method to perform this action.
* Discussion: The code linked below provides an example setup.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| PubSub | get_subscription | Check if a `Subscription` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/pubsub_sub_create) |

## Use Case: Source Repository 

### Source Repository

* Problem: I want validate a Source Repository has been created.
* Solution: Include the `get_repo` method to perform this action.
* Discussion: The code linked below provides an example setup.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| Source Repo | get_repo | Check if a `Repository` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/source_repo_create) |

## Use Case: Compute

### Virtual Private Cloud (VPC) 

* Problem: I want validate a VPC has been created.
* Solution: Include the `get_network` method to perform this action.
* Discussion: The code linked below provides an example setup.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| Compute | get_network | Check if a `network` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/vpc_network_create) |

### Virtual Private Cloud Subnet 

* Problem: I want validate a subnet has been created.
* Solution: Include the `get_subnetwork` method to perform this action.
* Discussion: The code linked below provides an example setup.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| Compute | get_subnetwork | Check if a `subnetwork` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/vpc_subnet_create) |


### Firewall Rule 

* Problem: I want validate a Firewall Rule has been created.
* Solution: Include the `get_firewall` method to perform this action.
* Discussion: The code linked below provides an example setup.

| Service | Method | Action | Link |
|---------|--------|--------|------|
| Compute | get_firewall | Check if a `firewall rule` is defined within a project | [Link](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/activity-tracking/fw_rule_create) |


## Example Setup

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
```bash
terraform init
```

2. Validate the code
```bash
terraform validate
```

3. Create the activity tracking code file
```bash
terraform apply -auto-approve
```

4. Optional: To remove the file created
```bash
terraform destroy -auto-approve
```
