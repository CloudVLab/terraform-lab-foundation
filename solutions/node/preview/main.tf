# solutions/node/preview/main.tf
locals {
  node = {
    name         = "Node.js 24"
    version      = "24"
    gcp_runtime  = "nodejs24"
    nvm_command  = "nvm install 24"
    docker_image = "node:24-slim"
  }
}