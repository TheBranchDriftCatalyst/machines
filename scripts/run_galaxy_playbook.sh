#!/bin/bash

# Variables
REPO_URL="https://github.com/TheBranchDriftCatalyst/machines.git"
REPO_DIR="/tmp/ansible-playbook-repo"
PLAYBOOK="image_scrubber.yml"
GALAXY_REQUIREMENTS="requirements.yml"

# Ensure Ansible is installed
if ! command -v ansible-playbook &> /dev/null
then
    echo "Ansible could not be found, please install it first."
    exit 1
fi

# Clone the repository
echo "Cloning the repository..."
if [ -d "$REPO_DIR" ]; then
    rm -rf "$REPO_DIR"
fi
git clone "$REPO_URL" "$REPO_DIR"

# Navigate to the repository directory
cd "$REPO_DIR" || { echo "Failed to change directory to $REPO_DIR"; exit 1; }

# Install dependencies via Ansible Galaxy if requirements.yml exists
if [ -f "$GALAXY_REQUIREMENTS" ]; then
    echo "Installing dependencies via Ansible Galaxy..."
    ansible-galaxy install -r "$GALAXY_REQUIREMENTS"
fi

# Run the playbook
#  TODO: allow running a rask from a playbook as well -t flag
echo "Running the Ansible playbook..."
ansible-playbook "$PLAYBOOK"

# Cleanup the repository directory
echo "Cleaning up..."
rm -rf "$REPO_DIR"

echo "Playbook execution completed."
