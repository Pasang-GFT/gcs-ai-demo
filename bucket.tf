provider "google" {
  project = "dev-env-1-412811"
}

resource "random_id" "bucket_id" {
  byte_length = 2
}

resource "google_storage_bucket" "bucket" {
  name                        = "bucket-${random_id.bucket_id.hex}"
  location                    = "US"
  versioning {
    enabled = true
  }
  logging {
    log_bucket        = "bucket-${random_id.bucket_id.hex}-logs"
    log_object_prefix = "log"
  }
  uniform_bucket_level_access = true
}