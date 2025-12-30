variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "cloud-tp-terraform"
}

variable "region" {
  description = "Region (e.g., europe-west1)"
  type        = string
  default     = "europe-west1"
}

variable "environment" {
  description = "Environment (dev|staging|prod)"
  type        = string
}

variable "app_name" {
  description = "Logical application name (kebab-case)"
  type        = string
}

variable "labels" {
  description = "Common labels to apply"
  type        = map(string)
  default     = {}
}
variable "buckets" {
  type = map(object({
    storage_class = optional(string, "STANDARD")
    force_destroy = optional(bool, true)
    versioning    = optional(bool, false)
  }))
  default = {
    assets  = {}
    images  = {}
    backups = { storage_class = "NEARLINE", versioning = true }
  }
}

variable "ingress_rules" {
  type = list(object({
    name        = string
    protocol    = string
    ports       = list(string)
    source_cidr = string
  }))
  default = [
    { name = "http", protocol = "tcp", ports = ["80"], source_cidr = "0.0.0.0/0" },
    { name = "https", protocol = "tcp", ports = ["443"], source_cidr = "0.0.0.0/0" }
  ]
}
