# resource "vault_database_secrets_mount" "db" {
#   path = "db"

#   mssql {
#     name           = "db1"
#     username       = "sa"
#     password       = "super_secret_1"
#     connection_url = "sqlserver://{{username}}:{{password}}@127.0.0.1:1433"
#     allowed_roles = [
#       "dev1",
#     ]
#   }
# }