output "app_dns" {
  value = cloudflare_record.record.name
}