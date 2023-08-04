terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.46.0"
    }

    #RAO    random = {
    #RAO      source  = "hashicorp/random"
    #RAO      version = "~> 3.4.3"
    #RAO    }

    tls = {
      source = "hashicorp/tls"
      #RAO      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16.1"
    }
  }

  required_version = "~> 1.3"
}

