resource "google_compute_instance" "vm_instance" {
  name         = "test-instance-333"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  metadata = {
    block-project-ssh-keys = "true"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  // Ensure that the instance is not publicly accessible by omitting the access_config block
  network_interface {
    network = "default"
    // access_config block is omitted to disable public IP
  }
}