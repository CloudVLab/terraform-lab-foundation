# Terraform: Google Compute Engine

| Branch | Description | Status |
|--------|-------------|--------|
| Main   | Latest version used for labs | ![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=2585d58a-918e-4bf1-b4de-e1c3a2ed949c) |
| Test   | Last Execution QA process    | ![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=878a4ae2-099c-4458-a575-f0be99a621aa) |

Create a virtual machine based on a Terraform configuration

## Configuration
__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
vm_name        = "tester-vm"
username       = "name@domain.com"
```

## Test Status

Ensure commits include the word `test` as part of the branch name to automatically initiate the QA proces.
Tests are automatically applied to any commits based on the `Test` branch.
Merging to the main branch is prohibited.

Please use the `main` branch to access the most stable Terraform script. 

| Trigger | State  | Description |
|---------|--------|-----------------------|
| GCE | Stable | Provision a single Google Compute Engine instance |
