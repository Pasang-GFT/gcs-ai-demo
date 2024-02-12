provider "google" {
  project = "dev-env-1-412811"
  region  = "europe-west1"
}

resource "google_storage_bucket" "bucket" {
  name     = "my-bucket-1672"
  versioning {
    enabled = true
  }
  logging {
    log_bucket        = "my-logs-bucket"
    log_object_prefix = "log"
  }
  uniform_bucket_level_access = true

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = 365
    }
  }
}