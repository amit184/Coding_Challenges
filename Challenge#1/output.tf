output "external_ip" {
  value = "${google_compute_forwarding_rule.compute.ip_address}"
}

output "database-name" {
  value       = google_sql_database_instance.main.name
  description = "database name."
}