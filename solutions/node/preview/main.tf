# solutions/node/preview/main.tf
locals {
  node = {
    name         = "Node.js 26"
    version      = "26"
    gcp_runtime  = "nodejs26"
    nvm_command  = "nvm install 26"
    docker_image = "node:26-slim"
  }
}