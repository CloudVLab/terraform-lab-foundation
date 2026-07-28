# solutions/node/stable/main.tf
locals {
  node = {
    name         = "Node.js 22 LTS"
    version      = "22"
    gcp_runtime  = "nodejs22"
    nvm_command  = "nvm install 22"
    docker_image = "node:22-slim"
  }
}