# solutions/gen_ai_models/dev/main.tf
locals {
  models = {
    "gemini_pro" = {
      "model_id"   = "gemini-2.5-pro"
      "model_name" = "Gemini 2.5 Pro"
    },
    "gemini_flash" = {
      "model_id"   = "gemini-2.5-flash"
      "model_name" = "Gemini 2.5 Flash"
    },
    "gemini_flash_lite" = {
      "model_id"   = "gemini-2.5-flash-lite"
      "model_name" = "Gemini 2.5 Flash-Lite"
    },
    "gemini_flash_image" = {
      "model_id"   = "gemini-2.5-flash-image"
      "model_name" = "Gemini 2.5 Flash Image"
    },
    "gemini_embedding" = {
      "model_id"   = "gemini-embedding-001"
      "model_name" = "Gemini Embedding 001"
    },
    "multimodal_embedding" = {
      "model_id"   = "multimodalembedding@001"
      "model_name" = "Embeddings for Multimodal"
    }
  }
}
