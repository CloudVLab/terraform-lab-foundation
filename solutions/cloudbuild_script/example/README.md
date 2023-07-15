# Terraform: Cloud Build Script


## Example

The example is based on the following hierarchy:

```
.
├── instructions
│   ├── en.md
│   └── img
├── QL_OWNER
└── qwiklabs.yaml 
```

## Script

Add the example Terraform code module to your project
```bash
curl  -L https://github.com/CloudVLab/terraform-lab-foundation/raw/main/solutions/cloudbuild_script/example/install.sh | bash
```

## Task 1. Example

The script will update the hierarchy:

```
.
├── instructions
│   ├── en.md
│   └── img
├── QL_OWNER
├── qwiklabs.yaml
└── tf
    ├── scripts/ 
    ├── main.tf
    ├── outputs.tf
    ├── runtime.yaml
    └── variables.tf
```

__NOTE:__ The Terraform examples assume a configuration sub-directory 
named `tf` is present.

## Qwiklabs Yaml

Update the `qwiklabs.yaml` to include startup_script configuration i.e. Terraform

#### Custom Properties

```
1  - type: gcp_project
2    id: project_0
3    variant: gcpd
4    ssh_key_user: user_0
5    startup_script:
6      type: qwiklabs
7      path: tf
```


Update the `qwiklabs.yaml` to include visible output returned from the startup_script

#### Visible Outputs

```
 1  student_visible_outputs:
 2    - label: "Open Google Cloud console"
 3      reference: project_0.console_url
 4    - label: "GCP Username"
 5      reference: user_0.username
 6    - label: "GCP Password"
 7      reference: user_0.password
```


Add a custom property by referencing the Terrform output variables.
Append the values to the `student_visible_outputs` section in the `qwiklabs.yaml`

```
 1  student_visible_outputs:
 2    - label: "Open Google Console"
 3      reference: project_0.console_url
 4    - label: "GCP Username"
 5      reference: user_0.username
 6    - label: "GCP Password"
 7      reference: user_0.password
```

#### Dynamic Variables

The output variable can be accessed with the following reference:

N/A
