output "flux_namespace" {
  value       = flux_bootstrap_git.this.namespace
  description = "The namespace in which Flux is deployed."
}