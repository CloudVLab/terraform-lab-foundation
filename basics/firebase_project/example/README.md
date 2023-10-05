# Terraform: Firebase Project 

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
curl -L https://github.com/CloudVLab/terraform-lab-foundation/raw/main/basics/firebase_project/example/install.sh | bash
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
    ├── main.tf
    ├── outputs.tf
    ├── runtime.yaml
    └── variables.tf
```

__NOTE:__ The Terraform examples assume a configuration sub-directory 
named `tf` is present.
