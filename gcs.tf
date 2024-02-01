provider "google" {
  project = "dev-env-1-412811"
  region  = "eu-west1"
}

resource "google_storage_bucket" "bucket" {
  name     = "ai-demo-bucket-3336"
  location = "EU"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "bucket2" {
  name     = "ai-demo-bucket-3337"
  location = "EU"
  uniform_bucket_level_access = true
}