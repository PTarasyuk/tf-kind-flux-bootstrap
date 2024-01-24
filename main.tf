resource "tls_private_key" "this" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

data "tls_public_key" "private_key_pem" {
  private_key_pem = tls_private_key.this.private_key_pem
}

provider "github" {
  owner = var.github_owner
  token = var.github_token
}

resource "github_repository" "this" {
  name       = var.flux_gh_repo_name
  visibility = var.flux_gh_repo_visibility
  auto_init  = true
}

resource "github_repository_deploy_key" "this" {
  title      = var.flux_gh_repo_key_title
  repository = github_repository.this.name
  key        = tls_private_key.this.public_key_openssh
  read_only  = false
}

locals {
  k8s_config_path = pathexpand("${path.root}/kind.conf")
}

resource "kind_cluster" "this" {
  name            = var.cluster_name
  kubeconfig_path = local.k8s_config_path
  node_image      = "kindest/node:v1.27.1"
  wait_for_ready  = true
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    node {
      role = "control-plane"
    }
    node {
      role = "worker"
    }
  }
}

provider "flux" {
  kubernetes = {
    host                   = kind_cluster.this.endpoint
    client_certificate     = kind_cluster.this.client_certificate
    client_key             = kind_cluster.this.client_key
    cluster_ca_certificate = kind_cluster.this.cluster_ca_certificate
  }
  git = {
    url = "ssh://git@github.com/${var.github_owner}/${var.flux_gh_repo_name}.git"
    ssh = {
      username    = "git"
      private_key = tls_private_key.this.private_key_pem
    }
  }
}

resource "flux_bootstrap_git" "this" {
  depends_on = [github_repository_deploy_key.this]
  path       = var.flux_target_path
}
