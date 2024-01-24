variable "cluster_name" {
  type        = string
  default     = "kind-cluster"
  description = "Name of the cluster"

}

# variable "control_plane_count" {
#   type        = number
#   default     = 1
#   description = "Value of control plane count"
# }

# variable "worker_count" {
#   type        = number
#   default     = 0
#   description = "Value of worker count"
# }

# variable "flux_github_repo" {
#   type        = string
#   default     = "tf-kind-flux-gitops"
#   description = "Flux GitHub repository"
# }