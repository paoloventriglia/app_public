

provider "kubernetes" {
  config_path    = "~/.kube/config"
  }

provider "cloudflare" {
  api_token = "your token"
}

terraform {
  backend "remote" {
    organization = "your org"
    hostname     = "app.terraform.io"
    token        = "your token"

    workspaces {
      name = "your workspace"
    }
  }
  required_version = ">= 0.12"

  required_providers {
    google      = {}
    google-beta = {}
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    template   = {}
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}


