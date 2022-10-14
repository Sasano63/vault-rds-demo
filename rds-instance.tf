
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnet1" {
  vpc_id     = data.terraform_remote_state.hcp.outputs.vpc
  cidr_block = var.subnet-block1
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "db-subnet-1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = data.terraform_remote_state.hcp.outputs.vpc
  cidr_block = var.subnet-block2
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "db-subnet-2"
  }
}

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
}

