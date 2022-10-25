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
fwr_network      = "default" 

fwr_rules = [
  {
    fwr_name                    = "serverless-to-vpc-connector"
    fwr_description             = "serverless-to-vpc-connector"
    fwr_source_ranges           = [ "107.178.230.64/26", "35.199.224.0/19" ]
    fwr_destination_ranges      = null
    fwr_source_tags             = null
    fwr_source_service_accounts = null
    fwr_target_tags             = ["vpc-connector"]
    fwr_target_service_accounts = null
    fwr_priority                = "1000"
    fwr_direction               = "INGRESS"

    # Allow List
    allow = [{
      protocol     = "icmp"
      ports        = null
    },
    {
      protocol     = "tcp"
      ports        = [ "667" ]
    },
    {
      protocol     = "udp"
      ports        = [ "665-666" ]
    }]

    # Deny List
    deny = []

    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }

  }
]
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
