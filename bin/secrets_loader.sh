#!/bin/bash

decrypt_and_export_secrets() {
  local repo_name="$1"
  # !! This is hardcoded, no good way to really do this as it has to be absolute from
  # mutliple entrypoint directions. This is a good enough solution for now.
  local secrets_path="/Users/panda/catalyst-devspace/repos/common/secrets"

  # Enable automatic export of all variables
  set -o allexport

  # Decrypt and export the SOPS secrets
  if [ -f "${secrets_path}/private/${repo_name}/secrets.env" ]; then
    eval "$(sops -d "${secrets_path}/private/${repo_name}/secrets.env" | sed 's/^/export /')"
  else
    echo "Secrets file ${secrets_path}/private/${repo_name}/secrets.env not found."
  fi

  # Disable automatic export of all variables
  set +o allexport
}

# decrypt_and_export_secrets "your_repo_name"
