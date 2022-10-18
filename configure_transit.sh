#!/bin/sh
set -o xtrace

# Note: This script requires that the VAULT_ADDR, VAULT_NAMESPACE and VAULT_TOKEN environment variables be set.
# Example:
export VAULT_ADDR=
export VAULT_TOKEN=
export VAULT_NAMESPACE=admin

echo "Enabling the vault transit secrets engine..."

# Enable the transit secret engine
vault secrets enable transit 

# Create our customer key
vault write  -f transit/keys/customer-key

# Create our archive key to demonstrate multiple keys
vault write -f transit/keys/archive-key

#test and see if encryption works
vault write transit/encrypt/customer-key plaintext=$(base64 <<< "my secret data")

vault write transit/encrypt/archive-key plaintext=$(base64 <<< "my secret data")
vault write transit/decrypt/customer-key ciphertext=

echo decoded_ciphertext | base64 --decode
echo "Transit secret engine is setup"
