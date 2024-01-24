# Terraform module - KinD Cluster with Flux

This Terraform module creates a GitHub repository to be used as a source for KinD (K8S) cluster with Flux bootstrap.

## Usege

```hcl
module "kind-flux-bootstrap" {
  source            = "github.com/PTarasyuk/tf-kind-flux-bootstrap"
  github_owner      = <YOUR_GITHUB_USERNAME>
  github_token      = <YOUR_GITHUB_TOKEN>
  flux_gh_repo_name = <FLUX_GITHUB_REPOSITORY> # As exemple "flux-gitops"
}
```

```bash
kubectl --kubeconfig "./kind.conf" get all -A

######
# OR #
######

export KUBECONFIG="$(pwd)/kind.conf"
```

## Inputs

| Name                    | Descr                                       | Type   | Default             |
| ----------------------- | ------------------------------------------- | ------ | ------------------- |
| github_owner            | GitHub owner repository to use              | string |                     |
| github_token            | GitHub personal access token                | string |                     |
| cluster_name            | Name of the KinD cluster                    | string | kind-cluster        |
| flux_gh_repo_name       | Flux GitHub repository                      | string | tf-kind-flux-gitops |
| flux_gh_repo_visibility | The visibility of the GitOps repository     | string | private             |
| flux_gh_repo_key_title  | A title of the GitHub repository access key | string | flux0               |
| flux_target_path        | Flux manifests subdirectory                 | string | clusters            |

## Outputs

- `kubeconfig` - The path to the kubeconfig file.
- `host` - Kubernetes APIServer endpoint.
- `client_cert` - Client certificate for authenticating to cluster.
- `client_key` - Client key for authenticating to cluster.
- `cluster_ca` - Client verifies the server certificate with this CA cert.
- `flux_namespace` - The namespace in which Flux is deployed.

## Requirements

This module requires the following provider:

- [`hashicorp/tls`](https://registry.terraform.io/providers/hashicorp/tls)
- [`integrations/github`](https://registry.terraform.io/providers/integrations/github)
- [`tehcyx/kind`](https://registry.terraform.io/providers/tehcyx/kind)
- [`fluxcd/flux`](https://registry.terraform.io/providers/fluxcd/flux)

## License

This module is licensed under the MIT License. See the LICENSE file for details.
