# Terraform: Google Compute Engine

Create a virtual machine based on a Terraform configuration

| Channel | Status | Description |
|---------|--------|-------------|
| Stable  | ![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=2585d58a-918e-4bf1-b4de-e1c3a2ed949c) | Production environment used for labs |
| Staging | ![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=878a4ae2-099c-4458-a575-f0be99a621aa) |Development/integration testing environment used for QA process |

## Configuration
__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
vm_name        = "tester-vm"
username       = "name@domain.com"
```

## Stable

![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=2585d58a-918e-4bf1-b4de-e1c3a2ed949c)

The `main` branch contains the most stable revision of the Terraform script. 

__Merging directly to the main branch is prohibited.__


## Staging

![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=878a4ae2-099c-4458-a575-f0be99a621aa)

Commits to the are automatically submitted for integration tests.
Only code passing integration tests should be submitted for merging.
Once code is ready for review, please raise a PR for code approval and merge.


## Commits 

Ensure commits include the word `test` as part of the branch name to initiate the automated QA proces.

| Trigger | State  | Description |
|---------|--------|-----------------------|
| GCE | Stable | Provision a single Google Compute Engine instance |
