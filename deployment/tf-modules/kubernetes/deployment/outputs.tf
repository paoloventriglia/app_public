output "app_label" {
  value = kubernetes_deployment.deployment.metadata[0].labels.App
}

output "name" {
  value = kubernetes_deployment.deployment.metadata[0].name
}