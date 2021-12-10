# Terraform: Firewall 

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 

Create a Firewall policy based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

#### Qwiklabs Properties
```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
```

#### Custom Properties

```
fwr_name         = "allow-ssh-network" 
fwr_network      = "default" 
fwr_source_range = [ "0.0.0.0/0" ]
fwr_direction    = "INGRESS"
fwr_protocol     = "tcp"
fwr_ports        = [ "22" ]
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
