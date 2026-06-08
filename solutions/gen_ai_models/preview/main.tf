# solutions/gen_ai_models/preview/main.tf
locals {
  models = {
    "gemini_pro" = {
      "model_id"   = "gemini-3.1-pro-preview"
      "model_name" = "Gemini 3.1 Pro"
    },
    "gemini_pro_image" = {
      "model_id"   = "gemini-3-pro-image"
      "model_name" = "Nano Banana Pro"
    },
    "gemini_flash" = {
      "model_id"   = "gemini-3.5-flash"
      "model_name" = "Gemini 3.5 Flash"
    },
    "gemini_flash_lite" = {
      "model_id"   = "gemini-3.1-flash-lite"
      "model_name" = "Gemini 3.1 Flash-Lite"
    },
    "gemini_flash_image" = {
      "model_id"   = "gemini-3.1-flash-image"
      "model_name" = "Nano Banana 2"
    },
    "gemini_flash_live" = {
      "model_id"   = "gemini-3.1-flash-live-preview"
      "model_name" = "Gemini 3.1 Flash Live"
    },
    "gemini_embedding" = {
      "model_id"   = "gemini-embedding-2"
      "model_name" = "Gemini Embedding"
    },
    "multimodal_embedding" = {
      "model_id"   = "multimodalembedding@001"
      "model_name" = "Embeddings for Multimodal"
    },
    "text_embedding" = {
      "model_id"   = "text-embedding-005"
      "model_name" = "Text Embedding 005"
    }
  }
}
