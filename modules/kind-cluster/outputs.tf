output "kubeconfig" {
  value       = "${path.root}/kind.conf"
  description = "The path to the kubeconfig file"
}

output "server" {
  value       = kind_cluster.this.endpoint
  description = "Kubernetes API Server URL"
}

output "client_key" {
  sensitive   = true
  value       = kind_cluster.this.client_key
  description = "The base64-decoded client key for authenticating to cluster"
}

output "client_cert" {
  sensitive   = true
  value       = kind_cluster.this.client_certificate
  description = "The base64-encoded client certificate for authenticating to cluster"
}

output "cluster_ca" {
  sensitive   = true
  value       = kind_cluster.this.cluster_ca_certificate
  description = "The base64-encoded client verifies the server certificate with this CA cert"
}