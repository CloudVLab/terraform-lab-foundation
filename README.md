# Terraform Test Suite

## Configurations
Example configurations that can be used with the Qwiklabs Platform

- [x] GCE
- [x] GKE
- [ ] Cloud Run
- [ ] Vertex AI Notebook
- [x] VPC
- [ ] Firewall


## Terraform Init

Reference: [init](https://www.terraform.io/docs/cli/commands/init.html)

```
terraform init
```

## Terraform Validate

Reference: [validate](https://www.terraform.io/docs/cli/commands/validate.html)

```
terraform validate
```

## Terraform Apply

Reference: [apply](https://www.terraform.io/docs/cli/commands/apply.html)

#### Auto Approve
Run the script without an approval prompt
```
terraform apply -var-file="test.tfvars" -auto-approve
```

#### Manual Approve
Run the script with an approval prompt
```
terraform apply -var-file="test.tfvars"
```

## Terraform Destroy

Reference: [destroy](https://www.terraform.io/docs/cli/commands/destroy.html)

#### Auto Approve
Run the script with an approval prompt
Run the destroy without an approval prompt
```
terraform destroy -var-file="test.tfvars" -auto-approve
```

#### Manual Approve
Run the script with an approval prompt
Run the script with an approval prompt
```
terraform destroy -var-file="test.tfvars"
```
