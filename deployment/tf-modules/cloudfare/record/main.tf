data "cloudflare_zones" "zone" {
  filter {
    name = "${var.name}.com"
  }
}

resource "cloudflare_record" "record" {
  zone_id = lookup(data.cloudflare_zones.zone.zones[0], "id")
  name    = var.record
  value   = var.ip
  type    = var.type
  ttl     = var.ttl
}