#!/bin/bash

# Bootstrap script for installing Vault 
# Send the log output from this script to user-data.log, syslog, and the console
# From: https://alestic.com/2010/12/ec2-user-data-output/
# exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# sudo yum install -y yum-utils
# sudo yum install -y jq

# curl --remote-name "https://releases.hashicorp.com/vault/1.12.0+ent/vault_1.12.0+ent_linux_amd64.zip"
# curl --remote-name "https://releases.hashicorp.com/vault/1.12.0+ent/vault_1.12.0+ent_SHA256SUMS"
# curl --remote-name "https://releases.hashicorp.com/vault/1.12.0+ent/vault_1.12.0+ent_SHA256SUMS.sig"

# unzip vault_1.12.0+ent_linux_amd64.zip

# sudo chown root:root vault

# sudo mv vault /usr/local/bin/

# vault -autocomplete-install
# complete -C /usr/local/bin/vault vault

# #mlock nutzen
# sudo setcap cap_ipc_lock=+ep /usr/local/bin/vault
# sudo useradd --system --home /etc/vault.d --shell /bin/false vault
