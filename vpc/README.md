# Terraform: Google Virtual Private Cloud 

Create a VPC based on the Terraform configuration in the main.tf file

## Configuration

Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id = "qwiklabs-resources"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
network_name   = "test-gke"
username       = "test-suite@qwiklabs.com"
```

Add these values to a file named `test.tfvars`.


## Test Status

| Trigger | Status | Description |
|---------|------|--------|
| terraform-vpc | ![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=faf7eeb6-5793-45c1-a5b1-edb28f3ed989) | Test Terraform script |
