output "address" {
  value = aws_db_instance.rds-db.address
  description = "Address of the db instance"
}

output "endpoint" {
  value = aws_db_instance.rds-db.endpoint
  description = "Endpoint of the db instance"
}

output "username" {
  value = aws_db_instance.rds-db.username
  description = "Initial username ot access db instance"
}
