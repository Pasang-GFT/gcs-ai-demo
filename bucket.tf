provider "google" {
  project = "dev-env-1-412811"
  region  = "us-central1"
}

resource "random_id" "bucket_id_suffix" {
  byte_length = 2
}

resource "google_storage_bucket" "bucket" {
  name                        = "my-bucket-${random_id.bucket_id_suffix.hex}"
  project                     = "dev-env-1-412811"
  location                    = "US"
  versioning {
    enabled = true
  }
  logging {
    log_bucket        = "my-logs-bucket"
    log_object_prefix = "log"
  }
}