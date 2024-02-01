provider "google" {
  project = "dev-env-1-412811"
  region  = "eu-west1"
  credentials = file("credentials.json") // Hardcoding credentials is a bad practice
}

resource "google_storage_bucket" "bucket" {
  name     = "ai-demo-bucket-3336"
  location = "EU"
  uniform_bucket_level_access = true
  force_destroy = true // This allows the bucket to be destroyed along with all its contents, which can be dangerous
  cors_rule {
    origin          = ["*"] // Allowing all origins can lead to security vulnerabilities
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}