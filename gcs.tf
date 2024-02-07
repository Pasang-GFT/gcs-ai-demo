provider "google" {
  project = "dev-env-1-412811"
  region  = "eu-west1"
}

resource "google_storage_bucket" "bucket" {
  name     = "ai-demo-bucket-${random_id.random.hex}"
  location = "EU"
  uniform_bucket_level_access = true
}

resource "random_id" "random" {
  byte_length = 3
}
resource "google_storage_bucket_object" "object" {
  name   = "test-object"
  bucket = google_storage_bucket.bucket.name
  source = "test.html"
}
#test