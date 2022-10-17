
# data "aws_availability_zones" "available" {
#   state = "available"
# }

# resource "aws_subnet" "subnet1" {
#   vpc_id     = data.terraform_remote_state.hcp.outputs.vpc
#   cidr_block = var.subnet-block1
#   availability_zone = data.aws_availability_zones.available.names[0]

#   tags = {
#     Name = "db-subnet-1"
#   }
# }

# resource "aws_subnet" "subnet2" {
#   vpc_id     = data.terraform_remote_state.hcp.outputs.vpc
#   cidr_block = var.subnet-block2
#   availability_zone = data.aws_availability_zones.available.names[1]

#   tags = {
#     Name = "db-subnet-2"
#   }
# }

# resource "aws_route_table_association" "rtb_subnet1" {
#   subnet_id      = aws_subnet.subnet1.id
#   route_table_id = data.terraform_remote_state.hcp.outputs.rtb
# }

# resource "aws_route_table_association" "rtb_subnet2" {
#   subnet_id      = aws_subnet.subnet2.id
#   route_table_id = data.terraform_remote_state.hcp.outputs.rtb
# }

# resource "aws_db_subnet_group" "db-subnetgroup" {
#   name       = "dbsubnetgroup"
#   subnet_ids = [data.terraform_remote_state.vault.outputs.subnet1, data.terraform_remote_state.vault.outputs.subnet2, data.terraform_remote_state.vault.outputs.subnet3]

#   tags = {
#     Name = "Vault DB subnet group"
#   }
# }

resource "aws_db_subnet_group" "db-subnetgroup" {
  name       = "dbsubnetgroup"
  subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

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

