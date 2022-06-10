# Terraform: Lab Proxy 

## Script

Add the example Terraform code module to your project
```bash
curl  -L https://github.com/CloudVLab/terraform-lab-foundation/raw/main/solutions/lab_proxy/example/install.sh | bash
```


## Example

The example is based on the following hierarchy:

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

#### Visible Outputs

```
 1  student_visible_outputs:
 2    - label: "Open Google Console"
 3      reference: project_0.console_url
 4    - label: "GCP Username"
 5      reference: user_0.username
 6    - label: "GCP Password"
 7      reference: user_0.password
 8    - label: "IDE"
 9      reference: project_0.startup_script.service_url
```
