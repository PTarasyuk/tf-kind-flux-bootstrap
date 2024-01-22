provider "kind" {
  provider   = "docker"
  kubeconfig = pathexpand("${path.root}/kind.conf")
}

resource "kind_cluster" "cluster" {
  name   = var.cluster_name
  config = <<-EOF
        apiVersion: kind.x-k8s.io/v1alpha4
        kind: Cluster
        nodes:
        %{for i in range(var.control_plane_count)}- role: control-plane
        %{endfor}
        %{for i in range(var.worker_count)}- role: worker
        %{endfor}
    EOF
}
