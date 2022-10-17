
# data "template_file" "user_data" {
#   template = file("${path.module}/vault.sh")
#   vars = {
#     license = "${var.VAULT_LICENSE}"
#     account_id = "${var.account_id}"
#   }
# }
# resource "aws_instance" "vaultserver" {                    
#   ami                         = var.ami 
#   instance_type               = var.instance_type
#   key_name                    = var.key
#   vpc_security_group_ids      = []
#   associate_public_ip_address = true
#   user_data                   = data.template_file.user_data.rendered
#   iam_instance_profile        = var.iam_profile
#   ebs_block_device {
#     device_name = var.device_name
#     delete_on_termination = true
#     volume_type = var.volume_type
#     volume_size = var.volume_size
#   }
#   tags = {
#     Name = var.instance_name
#     project = "vault"
#   }
# }



# resource "vault_mount" "db" {
#   path = "mysql"
#   type = "database"
# }

# resource "vault_database_secret_backend_connection" "mysql" {
#   backend       = vault_mount.db.path
#   name          = "postgres"
#   allowed_roles = ["demo-long", "demo-short"]

#   mysql {
#     username       = var.username
#     password       = var.dbpassword
#     connection_url = aws_db_instance.rds-db.address
#     }
# }

# resource "vault_database_secret_backend_role" "role-long" {
#   backend             = vault_mount.db.path
#   name                = "demo-long"
#   db_name             = vault_database_secret_backend_connection.mysql.name
#   creation_statements = ["CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON my_app.* TO '{{name}}'@'%';"]
#   default_ttl         = "3600" 
#   max_ttl             = "86400"
# }

# resource "vault_database_secret_backend_role" "role-short" {
#   backend             = vault_mount.db.path
#   name                = "demo-short"
#   db_name             = vault_database_secret_backend_connection.mysql.name
#   creation_statements = ["CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON my_app.* TO '{{name}}'@'%';"]
#   default_ttl         = "360" 
#   max_ttl             = "600"
# }