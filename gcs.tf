provider "google" {
  project = "dev-env-1-412811"
  region  = "us-central1"
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

resource "google_storage_bucket" "bucket" {
  name     = "bucket-${random_id.bucket_id.hex}"
  location = 

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
#test