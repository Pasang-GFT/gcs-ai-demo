provider "google" {
  project = var.project
  region  = var.region
}

resource "random_id" "bucket_id" {
  byte_length = var.byte_length
}

resource "google_storage_bucket" "bucket" {
  name                        = "my-bucket-${random_id.bucket_id.hex}"
  location                    = var.bucket_location
  versioning {
    enabled = true
  }
  logging {
    log_bucket        = "my-logs-bucket-${random_id.bucket_id.hex}"
    log_object_prefix = "log"
  }
}

module "gcs_bucket" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "1.7.0"

  project_id  = var.project
  names       = [var.bucket_name]
  location    = var.bucket_location
  versioning  = {
    enabled = true
  }
  logging = {
    log_bucket        = "my-logs-bucket-${random_id.bucket_id.hex}"
    log_object_prefix = "log"
  }
}