output "logs_bucket_name" {
    value       = google_storage_bucket.logs_archive.name
    description = "Logs bucket name"
}
