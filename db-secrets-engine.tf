

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