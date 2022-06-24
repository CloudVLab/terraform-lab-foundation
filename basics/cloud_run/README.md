# Terraform: Cloud Run 

| Channel | Status |
|---------|--------|
| Stable  | ![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=2585d58a-918e-4bf1-b4de-e1c3a2ed949c) |
| Beta    | ![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=878a4ae2-099c-4458-a575-f0be99a621aa) |

Create a virtual machine based on a Terraform configuration

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
gcr_service_account = "default"
gcr_startup_script  = "${file("./lab-init")}"
```
__NOTE:__
- [x] The default service account is compute developer
- [x] To replace the default use the email of custom SA
- [x] Naming convention for a startup-script is `lab-init`
- [x] The startup_script should only be used for short lived tasks
- [x] Do not use scripts to call other scripts

## Example

View the [example configuration](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/basics/cloud_run/example) to get started.

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| gcr_service_url | The external IP assigned to the GCE instance |

## Adding a Commit 

Commits to the repository will initiate the automated QA process

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.