# Chatbot Assessment
output "persona" {
  value = {
    name        = var.name
    topic       = var.topic
    knowledge   = var.knowledge
    role        = var.role
    messageText = var.messageText
    imageUrl    = var.imageUrl
    time        = var.time
    endpoint    = var.endpoint
  }
}
