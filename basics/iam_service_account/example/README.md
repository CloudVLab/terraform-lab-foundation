# Terraform: IAM Service Account 

## Example

The example is based on the following hierarchy:

```
.
├── instructions
│   ├── en.md
│   └── img
├── QL_OWNER
└── qwiklabs.yaml 
```



## Add the module to the directory

Add the example Terraform code module to your project
```
curl -L https://github.com/CloudVLab/terraform-lab-foundation/raw/main/basics/iam_service_account/example/install.sh | bash
```


## View the update directory

The example is based on the following heirarchy:
```
.
├── instructions
│   ├── en.md
│   └── img
├── QL_OWNER
├── qwiklabs.yaml
└── tf
    ├── main.tf
    ├── outputs.tf
    ├── runtime.yaml
    └── variables.tf
```

__NOTE:__ The Terraform examples assume a configuration sub-directory 
named `tf` is present.

## Qwiklabs Yaml

#### Custom Properties

Add a startup_script section to `qwiklabs.yaml` to run Terraform

```
1  - type: gcp_project
2    id: project_0
3    variant: gcpd
4    ssh_key_user: user_0
5    startup_script:
6      type: qwiklabs
7      path: tf
```

The general overrides values are illustrated below:

| Field | Default | Comment |
|-------|---------|---------|
| iam_sa_name | custom-sa | Service account name |
| iam_sa | custom-sa | Service account display name |
| iam_sa_description  | Customer service account for application | Service account description |
