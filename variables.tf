variable "github_owner" {
  type        = string
  description = "GitHub owner repository to use"
}

variable "github_token" {
  type        = string
  description = "GitHub personal access token"
}

variable "cluster_name" {
  type        = string
  default     = "kind-cluster"
  description = "Name of the KinD cluster"
}

variable "flux_gh_repo_name" {
  type        = string
  default     = "tf-kind-flux-gitops"
  description = "Flux GitHub repository"
}

variable "flux_gh_repo_visibility" {
  type        = string
  default     = "private"
  description = "The visibility of the GitOps repository"
}

variable "flux_gh_repo_key_title" {
  type        = string
  default     = "flux0"
  description = ""
}

variable "flux_target_path" {
  type        = string
  default     = "clusters"
  description = "Flux manifests subdirectory"
}
