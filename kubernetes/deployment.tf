resource "kubernetes_deployment" "app" {
  metadata {
    name = var.app
    labels = {
      app = var.app
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.app
      }
    }

    template {
      metadata {
        labels = {
          app = var.app
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = var.app

          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}