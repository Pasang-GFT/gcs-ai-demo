provider "google" {
  project        = "dev-env-1-412811"
  region         = "us-central1"
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

resource "google_storage_bucket" "bucket" {
  name     = "bucket-${random_id.bucket_id.hex}"
  location = "US-CENTRAL1"
  force_destroy = true
}