
output "kubeconfig" {
  value       = "${path.root}/kind.conf"
  description = "The path to the kubeconfig file."
}

output "host" {
  value       = kind_cluster.this.endpoint
  description = "Kubernetes APIServer endpoint."
}

output "client_cert" {
  sensitive   = true
  value       = kind_cluster.this.client_certificate
  description = "Client certificate for authenticating to cluster."
}

output "client_key" {
  sensitive   = true
  value       = kind_cluster.this.client_key
  description = "Client key for authenticating to cluster."
}

output "cluster_ca" {
  sensitive   = true
  value       = kind_cluster.this.cluster_ca_certificate
  description = "Client verifies the server certificate with this CA cert."
}

output "flux_namespace" {
  value       = flux_bootstrap_git.this.namespace
  description = "The namespace in which Flux is deployed."
}
