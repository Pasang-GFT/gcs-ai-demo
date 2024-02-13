provider "google" {
  project = "dev-env-1-412811"
}

resource "google_storage_bucket" "bucket" {
  name     = "my-bucket-1672"

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
#test