provider "google" {
  project = "dev-env-1-412811"
  region  = "eu-west1"
}

resource "google_storage_bucket" "bucket" {
  name                        = "ai-demo-bucket-${random_id.random.hex}"
  location                    = "EU"
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
  logging {
    log_bucket        = "ai-demo-logs-bucket-${random_id.random.hex}"
    log_object_prefix = "logs"
  }
}

resource "random_id" "random" {
  byte_length = 3
}