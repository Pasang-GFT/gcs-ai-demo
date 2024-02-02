provider "google" {
  project = "dev-env-1-412811"
  region  = "eu-west1"
}

resource "google_storage_bucket" "bucket" {
  name     = "ai-demo-bucket-${random_id.random.hex}"
  location = "EU"
  uniform_bucket_level_access = true
}

# I want a random number to be generated and used in the bucket name
resource "random_id" "random" {
  byte_length = 4
}