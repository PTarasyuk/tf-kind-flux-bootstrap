terraform {
  required_providers {

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }

    github = {
      source  = "integrations/github"
      version = ">= 5.9.1"
    }

    kind = {
      source  = "tehcyx/kind"
      version = "0.2.1"
    }

    flux = {
      source  = "fluxcd/flux"
      version = "1.2.2"
    }

  }
}
