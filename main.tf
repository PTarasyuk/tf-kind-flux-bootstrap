module "hc_tls_key" {
  source = "./modules/hc-tls-keys"
}

module "github_repository" {
  source                   = "./modules/gh-repository"
  github_owner             = var.github_owner
  github_token             = var.github_token
  repository_name          = var.flux_github_repo
  public_key_openssh       = module.hc_tls_key.public_key_openssh
  public_key_openssh_title = "flux0"
}

module "kind_cluster" {
  source              = "./modules/kind-cluster"
  cluster_name        = "kind-cluster"
  control_plane_count = 1
}

module "flux_bootstrap" {
  source                 = "./modules/flux-bootstrap"
  github_repository      = "${var.github_owner}/${var.flux_github_repo}"
  private_key            = module.hc_tls_key.private_key_pem
  host                   = module.kind_cluster.server
  client_cert            = module.kind_cluster.client_cert
  client_key             = module.kind_cluster.client_key
  cluster_ca             = module.kind_cluster.cluster_ca 
}
