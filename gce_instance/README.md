# Terraform: Google Compute Engine

Create a virtual machine based on a Terraform configuration

## Staging

![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=878a4ae2-099c-4458-a575-f0be99a621aa)

Commits to staging branches are automatically submitted for integration tests.
Only code passing integration tests are eligible for merging.

__Raise a PR for code approval and merge, once the code is ready for review.__ 

## Stable

![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=2585d58a-918e-4bf1-b4de-e1c3a2ed949c)

The `main` branch contains the most stable revision of the Terraform script. 

__Merging directly to the main branch is prohibited.__

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
vm_name        = "tester-vm"
username       = "name@domain.com"
```

## Accessing Output Values 

The external IP assigned to the GCE instance
```
gce_external_ip
```

The name of the GCE instance
```
gce_instance_name
```

## Adding a Commit 

Commits to the repository will initiate the automated QA proces.
It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
