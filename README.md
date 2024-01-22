# Terraform module - KinD Cluster with Flux bootstrap

This Terraform module creates a Git repository to be used as a source for KinD (K8S) cluster with Flux bootstrap.

```bash
kubectl --kubeconfig "./kind.conf" get all -A

######
# OR #
######

export KUBECONFIG="$(pwd)/kind.conf"
```
