# Chatbot Assessment
output "question" {
  value = {
    tag      = var.tag
    question = var.question
    options  = var.options
    answer   = var.answer
  }
}
