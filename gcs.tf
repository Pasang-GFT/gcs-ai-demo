provider "google" {
  project = "dev-env-1-412811"
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

resource "google_storage_bucket" "bucket" {
  name                        = "ai-demo-${random_id.bucket_id.hex}"
  location                    = "EU"
  versioning {
    enabled = true
  }
  logging {
    log_bucket        = "ai-demo-logs-${random_id.bucket_id.hex}"
    log_object_prefix = "log"
  }
  uniform_bucket_level_access = true
}