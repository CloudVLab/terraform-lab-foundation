# solutions/gen_ai_models/preview/main.tf
locals {
  models = {
    "gemini_pro" = {
      "model_id"   = "gemini-3-pro-preview"
      "model_name" = "Gemini 3 Pro"
    },
    "gemini_pro_image" = {
      "model_id"   = "gemini-3-pro-image-preview"
      "model_name" = "Gemini 3 Pro Image"
    },
    "gemini_flash" = {
      "model_id"   = "gemini-3-flash-preview"
      "model_name" = "Gemini 3 Flash"
    },
    "gemini_flash_lite" = {
      "model_id"   = "gemini-2.5-flash-lite"
      "model_name" = "Gemini 2.5 Flash-Lite"
    },
    "gemini_flash_image" = {
      "model_id"   = "gemini-2.5-flash-image"
      "model_name" = "Gemini 2.5 Flash Image"
    },
    "gemini_flash_live" = {
      "model_id"   = "gemini-live-2.5-flash-native-audio"
      "model_name" = "Gemini 2.5 Flash Native Audio"
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
