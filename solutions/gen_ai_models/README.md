# Terraform: Generative AI Models

| Channel   | Status                          |
|---        |---                              |
| Dev       | Active Development & Testing    |
| Preview   | Preview Release                 |
| Stable    | Production Ready (Live Labs)    |

This module provisions Generative AI models on Google Cloud.

## Accessing Output Values

This table compares the configured `model_id` and `model_name` across the stable, preview, and development channels.

| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |
|---|---|---|---|---|
| `models` | A map of all available Generative AI models. | *Full Map* | *Full Map* | *Full Map* |
| `gemini_pro` | Gemini Pro model details. | `gemini-2.5-pro`<br>_(Gemini 2.5 Pro)_ | `gemini-3.1-pro-preview`<br>_(Gemini 3.1 Pro)_ | `gemini-3.1-pro-preview`<br>_(Gemini 3.1 Pro)_ |
| `gemini_pro_image` | Gemini Pro Image model details. | `gemini-3-pro-image`<br>_(Nano Banana Pro)_ | `gemini-3-pro-image`<br>_(Nano Banana Pro)_ | `gemini-3-pro-image`<br>_(Nano Banana Pro)_ |
| `gemini_flash` | Gemini Flash model details. | `gemini-3.5-flash`<br>_(Gemini 3.5 Flash)_ | `gemini-3.5-flash`<br>_(Gemini 3.5 Flash)_ | `gemini-3.5-flash`<br>_(Gemini 3.5 Flash)_ |
| `gemini_flash_lite` | Gemini Flash Lite model details. | `gemini-3.1-flash-lite`<br>_(Gemini 3.1 Flash-Lite)_ | `gemini-3.1-flash-lite`<br>_(Gemini 3.1 Flash-Lite)_ | `gemini-3.1-flash-lite`<br>_(Gemini 3.1 Flash-Lite)_ |
| `gemini_flash_image` | Gemini Flash Image model details. | `gemini-3.1-flash-image`<br>_(Nano Banana 2)_ | `gemini-3.1-flash-image`<br>_(Nano Banana 2)_ | `gemini-3.1-flash-image`<br>_(Nano Banana 2)_ |
| `gemini_flash_live` | Gemini Flash Native Audio model details. | `gemini-live-2.5-flash-native-audio`<br>_(Gemini 2.5 Flash Native Audio)_ | `gemini-3.1-flash-live-preview`<br>_(Gemini 3.1 Flash Live)_ | `gemini-3.1-flash-live-preview`<br>_(Gemini 3.1 Flash Live)_ |
| `gemini_embedding` | Gemini Embedding model details. | `gemini-embedding-2`<br>_(Gemini Embedding)_ | `gemini-embedding-2`<br>_(Gemini Embedding)_ | `gemini-embedding-2`<br>_(Gemini Embedding)_ |
| `multimodal_embedding` | Embeddings for Multimodal model details. | `multimodalembedding@001`<br>_(Embeddings for Multimodal)_ | `multimodalembedding@001`<br>_(Embeddings for Multimodal)_ | `multimodalembedding@001`<br>_(Embeddings for Multimodal)_ |
| `text_embedding` | Text Embedding model details. | `text-embedding-005`<br>_(Text Embedding 005)_ | `text-embedding-005`<br>_(Text Embedding 005)_ | `text-embedding-005`<br>_(Text Embedding 005)_ |
## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.