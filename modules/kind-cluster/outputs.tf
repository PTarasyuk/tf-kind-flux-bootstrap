output "kubeconfig" {
  value       = "${path.root}/kind.conf"
  description = "The path to the kubeconfig file"
}

output "server" {
  value       = kind_cluster.cluster.server
  description = "Kubernetes API Server URL"
}

output "client_key" {
  sensitive   = true
  value       = base64decode(kind_cluster.cluster.client_key_data)
  description = "The base64-decoded client private key data for connecting the cluster"
}

output "client_cert" {
  sensitive   = true
  value       = base64decode(kind_cluster.cluster.client_certificate_data)
  description = "The base64-encoded client certificate data for connecting the cluster"
}

output "cluster_ca" {
  sensitive   = true
  value       = base64decode(kind_cluster.cluster.ca_certificate_data)
  description = "The base64-encoded CA Certificate used by the API Server"
}