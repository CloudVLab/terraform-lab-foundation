# solutions/generative-ai-models/main.tf
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
    "gemini_embedding" = {
      "model_id"   = "gemini-embedding-001"
      "model_name" = "Gemini Embedding 001"
    }
  }
}
