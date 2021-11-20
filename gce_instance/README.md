# Terraform: Google Compute Engine

Create a virtual machine based on a Terraform configuration

## Channel: Staging

![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=878a4ae2-099c-4458-a575-f0be99a621aa)

Commits to staging branches are automatically submitted for integration tests.
Only code passing integration tests are eligible for merging.

__Raise a PR for code approval and merge, once the code is ready for review.__ 

## Channel: Stable

![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=2585d58a-918e-4bf1-b4de-e1c3a2ed949c)

The `main` branch contains the most stable revision of the Terraform script. 

__Merging directly to the main branch is prohibited.__

## Variables: Input 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
vm_name        = "tester-vm"
username       = "name@domain.com"
```

## Variables: Output 

TBC

## Repository: Commits 

Commits to the repository will initiate the automated QA proces.
It is highly recommended that modules are tested locally before making a commit.

## Repository: Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
