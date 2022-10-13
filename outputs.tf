output "address" {
  value = aws_db_instance.rdsdb.address
  description = "Address of the db instance"
}

output "endpoint" {
  value = aws_db_instance.rdsdb.endpoint
  description = "Endpoint of the db instance"
}

output "username" {
  value = aws_db_instance.rdsdb.username
  description = "Initial username ot access db instance"
}
