provider "google" {
  project = "dev-env-1-412811"
  region  = "us-central1"
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

resource "google_storage_bucket" "bucket" {
  name          = "bucket-${random_id.bucket_id.hex}"
  location      = "US-CENTRAL1"
  force_destroy = true

  versioning {
    enabled = true
  }

  logging {
    log_bucket        = "bucket-${random_id.bucket_id.hex}-logs"
    log_object_prefix = "log"
  }
}