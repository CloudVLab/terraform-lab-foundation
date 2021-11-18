# Terraform: Google Compute Engine

Create a VM based on the Terraform configuration in the main.tf file

## Configuration
Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id = "qwiklabs-resources"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
vm_name        = "test-vm"
username       = "test-suite@qwiklabs.com"
```

Add these values to a file named `test.tfvars`.


## Test Status

| Trigger | Status | Description |
|---------|------|--------|
| terraform-gce | ![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=190e46f8-5048-4a4a-a94c-038104485ef8) | Test Terraform script |
