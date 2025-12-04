# Terraform: Generative AI Models

| Channel   | Status                          |
|---        |---                              |
| Dev       | Active Development & Testing    |
| Preview   | Preview Release                 |
| Stable    | Production Ready (Live Labs)    |

This module provisions Generative AI models on Google Cloud.

## Accessing Output Values

| Field | Description | Channel |
|---|---|---|
| `models` | A map of all available Generative AI models. | Stable, Preview |
| `gemini_pro` | Gemini Pro model details. | Stable, Preview |
| `gemini_pro_image` | Gemini Pro Image (Nano Banana 2) model details. | Preview |
| `gemini_flash` | Gemini Flash model details. | Stable |
| `gemini_flash_lite` | Gemini Flash Lite model details. | Stable |
| `gemini_flash_image` | Gemini Flash Image (Nano Banana) model details. | Stable |
| `gemini_embedding` | Gemini Embedding model details. | Stable |
| `multimodal_embedding` | Embeddings for Multimodal model details. | Stable |

## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.