# KinD Cluster Terraform module

This module deploys a Kubernetes cluster on KinD. The KinD cluster is provisioned with one or more node pools, allowing for customizable configurations. The generated Kubernetes configuration file (`kube.conf`) is stored in the directory where this module was called from.

## Usaage

```terraform
module "kind_cluster" {
  source              = "./modules/kind-cluster"
  cluster_name        = "kind-cluster"
  control_plane_count = 1
  worker_count        = 2
}

output "kubeconfig" {
  value       = module.kind_cluster.kubeconfig
  description = "The path to the kubeconfig file"
}
```

## Inputs

| Name                | Description                  | Type   | Default      |
| ------------------- | ---------------------------- | ------ | ------------ |
| cluster_name        | Name of the cluster          | string | kind-cluster |
| control_plane_count | Value of control plane count | number | 1            |
| worker_count        | Value of worker count        | number | 0            |

## Outputs

- `kubeconfig` - The path to the kubeconfig file `kind.conf`
- `server` - Kubernetes API Server URL
- `client_key` - The base64-decoded client key for authenticating to cluster
- `client_cert` - The base64-encoded client certificate for authenticating to cluster
- `cluster_ca` - The base64-encoded client verifies the server certificate with this CA cert

## Requirements

This module requires the following provider:

[`justenwalker/kind` version 0.17.0](https://registry.terraform.io/providers/justenwalker/kind/)

## License

This module is licensed under the MIT License. See the LICENSE file for details.
