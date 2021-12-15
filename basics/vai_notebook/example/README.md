# Terraform: Vertex AI Notebook 

## Example

The example is based on the following hierarchy:

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

The `qwiklabs.yaml` configuration file is used to set the definition of 
custom properties e.g. `tfResourceName` and `tfUsername`:

```
1  - type: gcp_project
2    id: project_0
3    variant: gcpd
4    ssh_key_user: user_0
5    startup_script:
6      type: qwiklabs
7      path: tf
8      custom_properties:
9      - key: tfResourceName
10        value: test-notebook
11      - key: tfUsername
12        reference: user_0.username
```
