# Terraform: Cloud Firestore 

Create a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

#### Qwiklabs Properties
```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
```

#### Custom Properties
```
gce_machine_type    = "n1-highmem-4"
gce_tags            = ["lab-vm"]
gce_machine_image   = "debian-cloud/debian-10" 
gce_machine_network = "default"
gce_scopes          = ["cloud-platform"]
gce_service_account = "default"
gce_startup_script  = "${file("./lab-init")}"
```
__NOTE:__
- [x] The default service account is compute developer
- [x] To replace the default use the email of custom SA
- [x] Naming convention for a startup-script is `lab-init`
- [x] The startup_script should only be used for short lived tasks
- [x] Do not use scripts to call other scripts

## Example

View the [example configuration](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/basics/gce_instance/example) to get started.

## Accessing Output Values 


## Adding a Commit 

Commits to the repository will initiate the automated QA process

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
