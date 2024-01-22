provider "flux" {
  kubernetes = {
    host                   = var.host
    client_certificate     = var.client_cert
    client_key             = var.client_key
    cluster_ca_certificate = var.cluster_ca
  }
  git = {
    url = "ssh://git@github.com/${var.github_repository}.git"
    ssh = {
      username    = "git"
      private_key = var.private_key
    }
  }
}

resource "flux_bootstrap_git" "this" {
  path = var.target_path
}