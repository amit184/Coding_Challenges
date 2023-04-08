resource "google_compute_network" "vpc-main" {
  provider                = google-beta
  name                    = "app-private-network"
  auto_create_subnetworks = false
  project                 = var.project_id
}

resource "google_compute_subnetwork" "vpc-subnet-1" {
  name          = "subnet-1"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc-main.id
}

resource "google_compute_subnetwork" "vpc-subnet-2" {
  name          = "subnet-2"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-east4"
  network       = google_compute_network.vpc-main.id
}