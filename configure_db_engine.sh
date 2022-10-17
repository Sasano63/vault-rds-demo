#!/bin/sh
set -o xtrace

# Note: This script requires that the VAULT_ADDR, VAULT_TOKEN, and MYSQL_ENDPOINT environment variables be set.
# Example:
export VAULT_ADDR=http://localhost:30000
export VAULT_TOKEN=root
export VAULT_NAMESPACE=dev
export MYSQL_ENDPOINT=mysql:3306


vault secrets enable database

# Configure the database secrets engine to talk to MySQL
vault write database/config/mysqldatabase \
    plugin_name=mysql-database-plugin \
    connection_url="{{username}}:{{password}}@tcp(${MYSQL_ENDPOINT})/" \
    allowed_roles="vault-demo-app","vault-demo-app-long" \
    username="admin" \
    password="supergeheim"

# Rotate root password
vault write  -force database/rotate-root/mysqldatabase

# Create a role with a longer TTL
vault write database/roles/vault-demo-app-long \
    db_name=mysqldatabase \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON my_app.* TO '{{name}}'@'%';" \
    default_ttl="1h" \
    max_ttl="24h"

# Create a role with a shorter TTL
vault write database/roles/vault-demo-app \
    db_name=mysqldatabase \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON my_app.* TO '{{name}}'@'%';" \
    default_ttl="3m" \
    max_ttl="6m"

#test and generate dynamic username password
vault read database/creds/vault-demo-app

echo "Database secret engine with mysql plugin configured "
