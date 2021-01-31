module "cloudy_d" {
  source         = "../tf-modules/kubernetes/deployment"
  name           = "your chosen name"
  container_port = 80
  image          = "your docker image"
  replicas       = 3
  app_label      = "your app label"
}

module "cloudy_s" {
  source    = "../tf-modules/kubernetes/service"
  app_label = module.cloudy_d.app_label
  name      = "your chosen name"
  port      = 80
  type      = "NodePort"
}

module "cloudy_i" {
  source       = "../tf-modules/kubernetes/ingress"
  name         = "your chosen name"
  service_name = module.cloudy_s.service_name
  service_port = 80
  appname      = var.record
}

module "cloudy_i_dns_record" {
  source = "../tf-modules/cloudfare/record"
  name   = var.name
  ip     = module.cloudy_i.lb_ip
  record = var.record
  ttl    = "300"
  type   = "A"
}