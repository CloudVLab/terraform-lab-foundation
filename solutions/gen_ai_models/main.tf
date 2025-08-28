# solutions/generative-ai-models/main.tf
locals {
  models = {
    "gemini_pro" = {
      "model_id"   = "gemini-2.0-pro"
      "model_name" = "Gemini 2.0 Pro"
    },
    "gemini_flash" = {
      "model_id"   = "gemini-2.0-flash"
      "model_name" = "Gemini 2.0 Flash"
    },
    "embedding" = {
      "model_id"   = "gemini-embedding-001"
      "model_name" = "Gemini Embedding 001"
    }
  }
}