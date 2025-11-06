# Terraform: Generative AI Models

| Channel   | Status                          |
|---        |---                              |
| Dev       | Active Development & Testing    |
| Stable    | Production Ready (Live Labs)    |

This module provisions Generative AI models on Google Cloud.

## Accessing Output Values

| Field | Description |
|---|---|
| `models` | A map of all available Generative AI models. |
| `gemini_pro` | Gemini Pro model details. |
| `gemini_flash` | Gemini Flash model details. |
| `gemini_flash_lite` | Gemini Flash Lite model details. |
| `gemini_flash_image` | Gemini Flash Image model details. |
| `gemini_embedding` | Gemini Embedding model details. |
| `multimodal_embedding` | Embeddings for Multimodal model details. |

## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.