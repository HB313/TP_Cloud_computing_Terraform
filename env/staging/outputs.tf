output "static_bucket" {
  value       = module.app_static.static_bucket_name
  description = "Static bucket name"
}

output "logs_bucket" {
  value       = module.logging.logs_bucket_name
  description = "Logs bucket name"
}
