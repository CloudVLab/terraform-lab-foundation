# Terraform: IAM Role Bind 

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
curl -L https://github.com/CloudVLab/terraform-lab-foundation/raw/main/basics/iam_role_bind/example/install.sh | bash
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
8      custom_properties:
9      - key: tfUser_0
10       reference: user_0.username
```

The above example passes the username through to the Terraform script.
If you wish to use a different account, override the `iam_user` value with a valid email account.

The general overrides values are illustrated below:

| Field | Default | Comment |
|-------|---------|---------|
| iam_sa_name | custom-sa | Custom service account name |
| iam_sa_description  | Customer service account for application | Service account description |
| iam_role | roles/viewer | IAM Role to be assigned |
