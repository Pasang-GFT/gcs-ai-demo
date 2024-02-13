provider "google" {
  project = "dev-env-1-412811"
}

resource "google_storage_bucket" "bucket" {
  name                        = "my-bucket-1672"
  location                    = "US"
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
  logging {
    log_bucket        = "my-logs-bucket"
    log_object_prefix = "log"
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = 365
    }
  }
}