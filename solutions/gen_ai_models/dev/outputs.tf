# solutions/generative-ai-models/outputs.tf

output "models" {
  description = "A map of all available Generative AI models."
  value       = local.models
}

output "gemini_pro" {
  description = "Gemini Pro model details."
  value       = local.models.gemini_pro
}

output "gemini_flash" {
  description = "Gemini Flash model details."
  value       = local.models.gemini_flash
}

output "gemini_embedding" {
  description = "Embedding model details."
  value       = local.models.gemini_embedding
}

output "gemini_flash_lite" {
  description = "Gemini Flash-Lite model details."
  value       = local.models.gemini_flash_lite
}

output "multimodal_embedding" {
  description = "Embeddings for Multimodal model details."
  value       = local.models.multimodal_embedding
}
