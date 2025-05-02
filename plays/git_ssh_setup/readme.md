```cd roles/git_ssh_setup

# Install required Galaxy roles (if any)
molecule dependency

# Run the full test suite: create container, converge, verify, destroy
molecule test

# OR step-by-step
molecule create
molecule converge
molecule verify
molecule destroy
```