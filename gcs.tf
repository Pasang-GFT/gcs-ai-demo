terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
  }
}

resource "google_storage_bucket" "bucket" {
  project                     = "dev-env-1-412811"
  name                        = "ai-demo-bucket-${random_id.bucket_id.hex}"
  location                    = "EU"
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
  logging {
    log_bucket        = "ai-demo-logs-bucket"
    log_object_prefix = "log"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "google_storage_bucket" "logs_bucket" {
  name     = "ai-demo-logs-bucket"
  location = "EU"
}

resource "google_storage_bucket_object" "object" {
  name         = "test.html"
  bucket       = google_storage_bucket.bucket.name
  source       = "test.html"
  content_type = "text/html"
}