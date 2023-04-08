resource "google_compute_firewall" "compute-ssh" {
  name    = "${var.bk_mig_name}-vm-ssh"
  network = "subnet-1"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-ssh"]
}

resource "google_compute_firewall" "compute-service" {
  name    = "${var.bk_mig_name}-vm-service"
  network = "subnet-1"

  allow {
    protocol = "tcp"
    ports    = ["${var.service_port}"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-service"]
}

resource "google_compute_forwarding_rule" "compute" {
  name       = "${var.bk_mig_name}-compute-instance-group"
  target     = "${google_compute_target_pool.compute.self_link}"
  load_balancing_scheme = "EXTERNAL"
  port_range = "1-65535"
}