#provider "kind" {
#  provider   = "docker"
#  kubeconfig = pathexpand("${path.root}/kind.conf")
#}

#provider "kind" {}

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
