# Terraform: Google Compute Engine

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

## Add the module to the directory 

Add the example Terraform code module to your project

```
curl -L https://github.com/CloudVLab/terraform-lab-foundation/raw/main/basics/gce_instance/example/install.sh | bash
```

## View the updated directory 

The example is based on the following hierarchy:

```
.
├── instructions
│   ├── en.md
│   └── img
├── QL_OWNER
├── qwiklabs.yaml
└── tf
    ├── scripts 
    │   └── lab-init
    ├── main.tf
    ├── outputs.tf
    ├── runtime.yaml
    └── variables.tf
```

__NOTE:__ The Terraform examples assume a configuration sub-directory 
named `tf` is present.

## Update Qwiklabs Yaml

#### Custom Properties

The `qwiklabs.yaml` configuration file is used to set the optional definition of 
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
10        value: test-vm
11      - key: tfUsername
12        reference: user_0.username
```

#### Visible Outputs

The `qwiklabs.yaml` configuration file is used to set the definition of 
student visible outputs e.g. `gce_external_ip` and `gce_instance_name`: 

```
 1  student_visible_outputs:
 2    - label: "Open Google Console"
 3      reference: project_0.console_url
 4    - label: "GCP Username"
 5      reference: user_0.username
 6    - label: "GCP Password"
 7      reference: user_0.password
 8    - label: External IP
 9      reference: project_0.startup_script.gce_external_ip
 10   - label: VM Name
 11     reference: project_0.startup_script.gce_instance_name
```
