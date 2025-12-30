output "static_buckets" {
  value       = module.app_static.bucket_names
  description = "Static bucket names by key"
}

output "logs_bucket" {
  value       = module.logging.logs_bucket_name
  description = "Logs bucket name"
}
