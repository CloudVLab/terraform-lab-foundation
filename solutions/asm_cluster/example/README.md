# Terraform: IDE Cloud Code 


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
curl  -L https://github.com/CloudVLab/terraform-lab-foundation/raw/main/solutions/ide_cloud_code/example/install.sh | bash
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
8      custom_properties:
9       - key: gcp_username
10        reference: user_0.local_username
11      - key: ssh_pvt_key
12        reference: user_0.ssh_key
13      - key: gke_cluster_name
14        value: "asm-cluster-test"
```


Update the `qwiklabs.yaml` to include visible output returned from the startup_script

#### Visible Outputs

```
 1  student_visible_outputs:
 2    - label: "Open Google Console"
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
 8    - label: "Cloudshell"
 9      reference: project_0.startup_script.service_url
```
