output "static_bucket_name" {
    value       = google_storage_bucket.static.name
    description = "Static bucket name"
}

output "static_bucket_self_link" {
    value       = google_storage_bucket.static.self_link
    description = "Static bucket self link"
}
