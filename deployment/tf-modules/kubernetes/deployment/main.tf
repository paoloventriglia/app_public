resource "kubernetes_deployment" "deployment" {
  metadata {
    name = "${var.name}-deployment"
    labels = {
      App = var.app_label
    }
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        App = var.app_label
      }
    }
    template {
      metadata {
        labels = {
          App = var.app_label
        }
      }
      spec {
        container {
          image = var.image
          name  = var.name

          port {
            container_port = var.container_port
          }
        }
      }
    }
  }
}