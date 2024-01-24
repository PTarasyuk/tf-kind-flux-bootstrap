
output "kubeconfig" {
  value       = module.kind_cluster.kubeconfig
  description = "The path to the kubeconfig file"
}

output "flux_namespace" {
  value       = module.flux_bootstrap.flux_namespace
  description = "The namespace in which Flux is deployed."
}
