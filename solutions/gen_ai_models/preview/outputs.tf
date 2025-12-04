# solutions/gen_ai_models/preview/outputs.tf

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

output "gemini_flash_lite" {
  description = "Gemini Flash-Lite model details."
  value       = local.models.gemini_flash_lite
}

output "gemini_flash_image" {
  description = "Gemini Flash Image model details."
  value       = local.models.gemini_flash_image
}

output "gemini_embedding" {
  description = "Embedding model details."
  value       = local.models.gemini_embedding
}

output "multimodal_embedding" {
  description = "Embeddings for Multimodal model details."
  value       = local.models.multimodal_embedding
}

output "gemini_pro_image" {
  description = "Gemini Pro Image model details."
  value       = local.models.gemini_pro_image
}
