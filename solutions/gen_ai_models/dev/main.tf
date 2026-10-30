# solutions/gen_ai_models/dev/main.tf
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
      "model_id"   = "gemini-3.6-flash"
      "model_name" = "Gemini 3.6 Flash"
    },
    "gemini_flash_lite" = {
      "model_id"   = "gemini-3.6-flash-lite"
      "model_name" = "Gemini 3.6 Flash-Lite"
    },
    "gemini_flash_lite_image" = {
      "model_id"   = "gemini-3.1-flash-lite-image"
      "model_name" = "Nano Banana 2 Lite"
    },
    "gemini_flash_image" = {
      "model_id"   = "gemini-3.1-flash-image"
      "model_name" = "Nano Banana 2"
    },
    "gemini_flash_live" = {
      "model_id"   = "gemini-3.8-live"
      "model_name" = "Gemini 3.8 Live"
    },
    "gemini_embedding" = {
      "model_id"   = "gemini-embedding-001"
      "model_name" = "Gemini Embedding 001"
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
