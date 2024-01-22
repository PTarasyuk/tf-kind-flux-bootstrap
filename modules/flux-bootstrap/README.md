# Terraform Flux Bootstrap Git Module

This Terraform module creates a Git repository to be used as a source for Flux Bootstrap.

## Usage

```hcl
module "flux_bootstrap" {
  source            = "./modules/fluxcd-flux-bootstrap"
  github_repository = "${var.GITHUB_OWNER}/${var.FLUX_GITHUB_REPO}"
  private_key       = module.tls_private_key.private_key_pem
  config_host       = module.gke_cluster.config_host
  config_token       = module.gke_cluster.config_token
  config_ca         = module.gke_cluster.config_ca
}
```

## Inputs

| Name                | Description                                                          | Type   | Default  |
| ------------------- | -------------------------------------------------------------------- | ------ | -------- |
| `github_repository` | The name of the Git repository to be created                         | string |          |
| `target_path`       | The path to clone the Git repository into. Default value is clusters | string | clusters |
| `private_key`       | The SSH private key to use for Git operations                        | string |          |
| `host`              | The hostname (in form of URI) of Kubernetes master                   | string |          |
| `client_cert`       | PEM-encoded client certificate for TLS authentication                | string |          |
| `client_key`        | PEM-encoded client certificate key for TLS authentication            | string |          |
| `cluster_ca`        | PEM-encoded root certificates bundle for TLS authentication          | string |          |

## Outputs

- `flux_namespace` - GitHub repository to store Flux manifests.

## Requirements

This module requires the following provider:

[`fluxcd/flux` version 1.2.2](https://registry.terraform.io/providers/fluxcd/flux/)

## License

This module is licensed under the MIT License. See the LICENSE file for details.