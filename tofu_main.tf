terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.4.0"
}

# ----------------------------
# Variables (only two need editing)
# ----------------------------
variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "REPLACE_WITH_YOUR_PROJECT_ID"
}

variable "ssh_public_key" {
  description = "SSH public key in OpenSSH format"
  type        = string
  default     = "REPLACE_WITH_YOUR_PUBLIC_KEY"
}

# ----------------------------
# Provider
# ----------------------------
provider "google" {
  project = var.project_id
  region  = "us-central1"
  zone    = "us-central1-a"
}

# ----------------------------
# Resource: VM
# ----------------------------
resource "google_compute_instance" "vm" {
  name         = "simple-vm"
  machine_type = "e2-micro"         # Small free-tier eligible VM
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" # Stable Debian OS
    }
  }

  network_interface {
    network       = "default"
    access_config {} # Assigns an ephemeral external IP
  }

  metadata = {
    ssh-keys = "tfuser:${var.ssh_public_key}"
  }
}

# ----------------------------
# Outputs
# ----------------------------
output "vm_name" {
  value = google_compute_instance.vm.name
}

output "vm_external_ip" {
  value = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}
