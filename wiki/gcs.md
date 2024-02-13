# Google Cloud Storage Bucket Terraform Configuration

This Terraform configuration is used to manage resources on Google Cloud Platform (GCP). Below is the detailed documentation of the code snippet provided.

## Provider Configuration

```hcl
provider "google" {
  project = "dev-env-1-412811"
}
```

### Overview

- **Provider Block**: The `provider` block configures the specified provider, in this case, Google Cloud Platform (GCP). Terraform uses it to interact with the APIs of the service provider.

### Parameters

- **project**: This field specifies the ID of the project on GCP where the resources will be created. In the given example, `"dev-env-1-412811"` is the project ID.

## Resource Configuration: Google Storage Bucket

```hcl
resource "google_storage_bucket" "bucket" {
  name     = "my-bucket-1672"
  location = "US"

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
```

### Overview

- **Resource Block**: The `resource` block defines a resource that exists within the infrastructure. This block is responsible for creating a Google Cloud Storage bucket.

### Parameters

- **name**: This parameter specifies the name of the bucket being created. Bucket names must be unique. In this example, the bucket is named `"my-bucket-1672"`.

- **location**: This parameter defines the location where the storage bucket will be created. It's set to `"US"` in this example, which means the data will reside in a data center in the United States.

- **uniform_bucket_level_access**: When set to `true`, it enables Uniform Bucket-Level Access on the bucket, which simplifies permissions and can enhance security by disabling object-level ACLs (Access Control Lists).

### Lifecycle Rule Configuration

The `lifecycle_rule` block within the `google_storage_bucket` resource configures the bucket's lifecycle rules. These rules allow you to automatically perform certain actions on objects within the bucket based on specified conditions.

#### Parameters

- **action**: This block specifies the action to take when the conditions are met. In this case, it's set to `"Delete"`, which means the affected objects will be deleted.

- **condition**: This block sets the conditions under which the specified action should take place. In this example, the condition is based on the `age` of the objects in the bucket.

  - **age**: This parameter is set to `365`, which means that objects will be automatically deleted if they are older than 365 days.

## Summary

This Terraform configuration sets up a Google Cloud Storage bucket with the name "my-bucket-1672" in the "US" location. It also configures a lifecycle rule to automatically delete objects that are older than 365 days. Uniform Bucket-Level Access is enabled to simplify permissions management across the bucket.