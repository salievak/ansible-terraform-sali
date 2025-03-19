# Firewall

resource "google_compute_network" "vpc_network" {
  name = "custom-vpc"
}

resource "google_compute_firewall" "allow_http_https_ssh" {
  name    = "allow-http-https-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Instance Debian

resource "google_compute_instance" "debian" {
  name         = "debian-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

# Public IP

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {}
  }

# SSH key  

  metadata = {
    ssh-keys = "sali-debian:${file("~/.ssh/id_rsa.pub")}"
  }

}

# Instance Ubuntu

resource "google_compute_instance" "ubuntu" {
  name         = "ubuntu-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

# Public IP

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {}
  }

# SSH key  

  metadata = {
    ssh-keys = "sali-ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

}

output "debian_ip" {
  value = google_compute_instance.debian.network_interface[0].access_config[0].nat_ip
}

output "ubuntu_ip" {
  value = google_compute_instance.ubuntu.network_interface[0].access_config[0].nat_ip
}