locals {
    labels = {
        for k, v in merge(var.labels, {
            app         = var.app_name
            environment = var.environment
        }) : lower(k) => lower(v)
    }
    bucket_name = lower("${var.app_name}-${var.environment}-logs")
}

resource "google_storage_bucket" "logs_archive" {
    name                        = local.bucket_name
    location                    = var.region
    force_destroy               = true
    uniform_bucket_level_access = true
    labels                      = local.labels

    lifecycle_rule {
        action    { type = "Delete" }
        condition { age  = 365 }
    }
}
