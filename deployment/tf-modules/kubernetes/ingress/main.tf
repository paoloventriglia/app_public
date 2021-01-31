resource "kubernetes_ingress" "ingress" {
  metadata {
    name = "${var.name}-ingress"
    annotations = {
      "ingress.gcp.kubernetes.io/pre-shared-cert" = var.appname
    }
  }


  spec {
    backend {
      service_name = var.service_name
      service_port = var.service_port
    }
  }

  wait_for_load_balancer = true
}
