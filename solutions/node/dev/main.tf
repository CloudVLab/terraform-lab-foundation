# solutions/node/dev/main.tf
locals {
  node = {
    lts = {
      name    = "Node.js LTS"
      version = "lts"
      nvm_command = "nvm install --lts"
      docker_command = null
      gcp_runtime = null
    }
    v24 = {
      name    = "Node.js 24"
      version = "24"
      nvm_command = "nvm install 24"
      docker_command = null
      gcp_runtime = null  
    }
    v22_14_0 = {
      name    = "Node.js 22.14.0"
      version = "22.14.0"
      nvm_command = "nvm install 22.14.0"
      docker_command = null
      gcp_runtime = null  
    }
    v22 = {
      name    = "Node.js 22"
      version = "22"
      nvm_command = "nvm install 22"
      docker_command = null
      gcp_runtime = null  
      }
    v20 = {
      name    = "Node.js 20"
      version = "20"
      nvm_command = "nvm install 20"
      docker_command = null
      gcp_runtime = "nodejs20"
    },
    v6_9_2 = {
      name    = "Node.js 6.9.2"
      version = "6.9.2"
      nvm_command = "nvm install 6.9.2"
      docker_command = "FROM node:6.9.2"
      gcp_runtime = null  
    }
  }
}