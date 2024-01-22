variable "github_repository" {
  type        = string
  description = "GitHub repository to store Flux manifests"
}

variable "target_path" {
  type        = string
  default     = "clusters"
  description = "Flux manifests subdirectory"
}

variable "private_key" {
  type        = string
  description = "The private key used to authenticate with the Git repository"
}

variable "host" {
  type        = string
  description = "The hostname (in form of URI) of Kubernetes master"
}

variable "client_cert" {
  type        = string
  description = "PEM-encoded client certificate for TLS authentication"
}

variable "client_key" {
  type        = string
  description = "PEM-encoded client certificate key for TLS authentication"
}

variable "cluster_ca" {
  type        = string
  description = "PEM-encoded root certificates bundle for TLS authentication"
}