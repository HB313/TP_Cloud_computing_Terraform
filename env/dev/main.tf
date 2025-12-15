terraform {
  required_version = ">= 1.6.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.40"
    }
  }

  backend "gcs" {
    bucket = "tfstate-cloud-tp-terraform"
    prefix = "terraform/state/dev"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source       = "../../modules/network"
  project_id   = var.project_id
  environment  = var.environment
  network_name = "${var.app_name}-vpc"
  region       = var.region
  cidr_block   = "10.20.0.0/16"
  labels       = var.labels
}

module "app_static" {
  source      = "../../modules/app_static"
  project_id  = var.project_id
  region      = var.region
  environment = var.environment
  app_name    = var.app_name
  labels      = var.labels
}

module "logging" {
  source      = "../../modules/logging"
  project_id  = var.project_id
  region      = var.region
  environment = var.environment
  app_name    = var.app_name
  labels      = var.labels
}

