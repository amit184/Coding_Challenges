output "database-name" {
  value       = google_sql_database_instance.main.name
  description = "database name."
}