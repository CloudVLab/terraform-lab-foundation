# Terraform: Generative AI Models

| Channel | Status |
|---|---|
| Stable  | TBC    |
| Beta    | TBC    |

This module provisions Generative AI models on Google Cloud.

## Using Input Values

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process.

Qwiklabs Properties
__NOTE:__ Qwiklabs properties are mandatory.
The mandatory values are used to initiate the project.
```bash
gcp_project_id       = "my-gcp-project"
gcp_region           = "us-central1"
```

## Accessing Output Values

| Field | Description |
|---|---|
| models | A map of all available Generative AI models. |
| gemini_pro | Gemini Pro model details. |
| gemini_flash | Gemini Flash model details. |
| embedding | Gemini Embedding model details. |

## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.