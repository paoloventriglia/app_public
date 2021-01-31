resource "kubernetes_service" "service" {
  metadata {
    name = "${var.name}-service"
  }
  spec {
    selector = {
      App = var.app_label
    }
    port {
      port = var.port
    }

    type = var.type
  }
}