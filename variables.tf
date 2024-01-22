variable "github_owner" {
  type        = string
  description = "GitHub owner repository to use"
}

variable "github_token" {
  type        = string
  description = "GitHub personal access token"
}

variable "flux_github_repo" {
  type        = string
  default     = "tf-kind-flux-gitops"
  description = "Flux GitHub repository"
}