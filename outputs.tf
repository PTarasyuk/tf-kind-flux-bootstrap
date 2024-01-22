
output "kubeconfig" {
  value       = module.kind_cluster.kubeconfig
  description = "The path to the kubeconfig file"
}

output "flux_namespace" {
  value       = module.flux_bootstrap.flux_namespace
  description = "The namespace in which Flux is deployed."
}

output "private_key_pem" {
  sensitive   = true
  value       = tls_private_key.this.private_key_pem
  description = "The generated private key in PEM format"
}

output "public_key_openssh" {
  sensitive   = true
  value       = tls_private_key.this.public_key_openssh
  description = "The generated public key in OpenSSH format"
}
