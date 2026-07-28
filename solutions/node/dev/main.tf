# solutions/node/dev/main.tf
locals {
  node = {
    name         = "Node.js 20 LTS"
    version      = "20"
    gcp_runtime  = "nodejs20"
    nvm_command  = "nvm install 20"
    docker_image = "node:20-slim"
  }
}
