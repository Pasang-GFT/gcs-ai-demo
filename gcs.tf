provider "google" {
  project     = "dev-env-1-412811"
  region      = "europe-west1"
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

resource "google_storage_bucket" "bucket" {
  name     = "ai-demo-${random_id.bucket_id.hex}"

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "bucket_iam" {
  bucket = google_storage_bucket.bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
```

