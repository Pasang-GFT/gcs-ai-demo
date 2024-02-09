provider "google" {
  project = "dev-env-1-412811"
  region  = "europe-west1"
}

resource "google_storage_bucket" "bucket" {
  name     = "my-bucket"
  project  = "dev-env-1-412811"

  uniform_bucket_level_access = true

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = 7
    }
  }
}
