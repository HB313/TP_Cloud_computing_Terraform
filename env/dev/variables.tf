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
