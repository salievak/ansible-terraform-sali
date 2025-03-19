terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = "practical-task-1-453019"
  region  = "us-central1"
  zone    = "us-central1-a"
}