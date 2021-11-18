# Terraform: Google Kubernetes Engine

Create a GKE cluster based on the Terraform configuration in the main.tf file

## Configuration

Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id = "qwiklabs-resources"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
cluster_name   = "test-gke"
username       = "test-suite@qwiklabs.com"
```

Add these values to a file named `test.tfvars`.


## Test Status

| Trigger | Status | Description |
|---------|------|--------|
| terraform-gke | ![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=910b4afa-06d7-40a5-8be7-517e5bd081fb) | Test Terraform script |
