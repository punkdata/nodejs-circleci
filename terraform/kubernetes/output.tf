output "gke_cluster" {
  value = var.cluster
}

output "endpoint" {
  value = kubernetes_service.app.status.0.load_balancer.0.ingress.0.ip
}