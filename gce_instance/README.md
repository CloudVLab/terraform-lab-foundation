# Terraform: Google Compute Engine

![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=2585d58a-918e-4bf1-b4de-e1c3a2ed949c)

Create a VM based on the Terraform configuration in the main.tf file

## Configuration
Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
vm_name        = "tester-vm"
username       = "name@domain.com"
```

## Test Status

| Trigger | State  | Description |
|---------|--------|-----------------------|
| gce     | Stable | Provision a single Google Compute Engine instance |
