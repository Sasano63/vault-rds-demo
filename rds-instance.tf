
resource "aws_db_subnet_group" "db-subnetgroup" {
  name       = "dbsubnetgroup"
  subnet_ids = [data.terraform_remote_state.hcp.outputs.subnet1, data.terraform_remote_state.hcp.outputs.subnet2]

  tags = {
    Name = "Vault DB subnet group"
  }
}

resource "aws_db_instance" "rds-db" {
  allocated_storage    = 10
  db_name              = "vaultdemoinstance"
  engine               = "mysql"
  engine_version       = "8.0.28"
  instance_class       = "db.t3.micro"
  username             = var.username
  password             = var.dbpassword
  db_subnet_group_name = aws_db_subnet_group.db-subnetgroup.name
  skip_final_snapshot  = true
  publicly_accessible  = true
}

