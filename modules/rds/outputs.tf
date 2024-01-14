output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.default.endpoint
}

output "db_instance_username" {
  description = "The master username for the RDS instance"
  value       = var.db_username
}

output "db_instance_name" {
  description = "The database name"
  value       = var.db_name
}
