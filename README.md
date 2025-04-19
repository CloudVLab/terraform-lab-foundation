# Terraform Lab Foundation

## Overview

Terraform Lab Foundation comprises of a number of parts:

* Qwiklab compatible samples
* Common use case examples 
* Automated testing of Terraform scripts
* Plug and Play components

## Building Blocks 
Example configurations that can be used to build content on the Qwiklabs Platform

#### API and Services
- [x] [API](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/api_service/README.md)

#### Compute
- [x] [GCE](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/gce_instance/README.md)
- [x] [GKE](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/gke_cluster/README.md)

#### Storage
- [x] [Cloud Storage](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/gcs_bucket/README.md)

#### Serverless
- [ ] [Cloud Run](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/cloud_run/README.md)
- [ ] [Cloud Functions](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/cloud_functions/README.md)

#### Networking
- [x] [VPC](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/vpc_network/README.md)
- [x] [Firewall](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/vpc_firewall/README.md)
- [x] [VPC Connector](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/vpc_connector/README.md)

#### AI/ML
- [x] [Vertex AI Notebook](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/vai_notebook/README.md)

#### Databases 
- [x] [Cloud SQL](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/cloudsql/README.md)

#### Big Data 
- [ ] [BigQuery](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/bigquery_data/README.md)

#### Identity and Access Management
- [ ] [Service Account](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/service_account/README.md)
- [ ] [API Access](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/api_access/README.md)
- [ ] [Role Binding](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/iam_role_bind/README.md)

#### Source Repository 
- [ ] [Source Repo](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/source_repo/README.md)

#### Vertex AI 
- [ ] [Vertex AI Notebook](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/vai_notebook/README.md)
- [ ] [Vertex AI Workbench](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/basics/vai_workbench/README.md)

## Technical Solutions

Example solutions pre-built for the Qwiklabs platform

- [x] [Cloudshell - Integrated Development Environment](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/solutions/ide_cloudshell/README.md)
- [x] [Cloud Code - Integrated Development Environment](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/solutions/ide_cloud_code/README.md)
- [x] [Web Developer - Proxy Integrated Development Environment](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/solutions/ide_web/README.md)
- [x] [Vertex AI Notebook - Proxy Workbench](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/solutions/proxy_vertex_workbench/README.md)
- [x] [AppSheet - CloudSQL MySQL](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/solutions/appsheet_cloudsql/README.md)
- [x] [BigQuery - Sports Analytics](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/solutions/bigquery_soccer/README.md)
- [x] [Proxy - General Proxy](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/solutions/lab_proxy/README.md)
- [ ] Custom VM


## Module Documentation

Generated documentation is created using `terraform-docs`.

The repo uses a pre-commit hook for both the basics and solutions folders.
A bash script has been added to automatically perform the documentation generation.


The script will run automatically when content is committed to the repo.

```
.pre-commit-config.yaml
```

To run the script manually when testing use the command below:

```
bash scripts/generate-docs.sh
```


## Channels

Release schedule for the supported channels:

| Channel | Audience | Description |
|---------|----------|-------------|
| Stable  | Prod     | Use this for the most stable versions of scripts |
| Beta    | QA       | Use this for the beta access to code updates |
| Dev     | Dev      | Use this to develop new Terraform building blocks and solutions | 

__NOTE:__
* Content authors should use the `stable` channel.
* Module developers should use the `dev` channel.

Scripts are maintained via channels - see [CHANNELS.md](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/CHANNELS.md) for more information.

## Contributing

Contributions are always welcome - see [CONTRIBUTING.md](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/CONTRIBUTING.md) for more information.

## License

GPE-3.0 - see [LICENSE](https://github.com/CloudVLab/terraform-lab-foundation/blob/main/LICENSE) for more information.
