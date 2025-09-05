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
  value       = local.models.embedding
}
