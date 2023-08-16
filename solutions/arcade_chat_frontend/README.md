# Terraform: Arcade Chat Frontend 

Create an Integrated Development Environment based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id  = "my-gcp-project"
gcp_region      = "us-central1"
gcp_zone        = "us-central1-a"
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| chat_service_url | The service URL for the chat app |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
