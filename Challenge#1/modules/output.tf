output "external_ip" {
  value = google_compute_forwarding_rule.compute.ip_address
}
