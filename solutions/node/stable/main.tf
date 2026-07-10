# solutions/node/dev/main.tf
locals {
  node = {
    lts = {
      name    = "Node.js LTS"
      version = "lts"
      command = "nvm install --lts"
    }
    v24 = {
      name    = "Node.js 24"
      version = "24"
      command = "nvm install 24"
    }
    v22_14_0 = {
      name    = "Node.js 22.14.0"
      version = "22.14.0"
      command = "nvm install 22.14.0"
    }
    v22 = {
      name    = "Node.js 22"
      version = "22"
      command = "nvm install 22"
    }
    v20 = {
      name    = "Node.js 20"
      version = "20"
      command = "nvm install 20"
    }
  }
}
