# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the "machines" component of the Catalyst devspace - an Ansible-based infrastructure management system for low-level machine provisioning and configuration. It uses Ansible Galaxy-compatible roles and playbooks for managing homelab infrastructure and development environments.

**Note: This repository is in active transition to a common pattern. See the roles directory for examples of the new structure being implemented.**

## Primary Commands

### Dependency Management
- `task deps` - Install all dependencies (Python, Ansible Galaxy, Molecule)
- `task deps:python` - Install Python dependencies via Poetry or pip
- `task deps:ansible` - Install Ansible Galaxy collections and roles from requirements.yml
- `task deps:molecule` - Install Molecule testing framework with Docker and Lima support

### Running Playbooks
- `task play -- <playbook_name>` - Run specific Ansible playbook (requires ANSIBLE_PASSWORD and ANSIBLE_BECOME_PASSWORD env vars)
- `task bootstrap` - Run bootstrap development environment playbook
- `task bootstrap:local` - Run bootstrap on localhost only
- `task bootstrap:test` - Run bootstrap in safe test mode

### Documentation Generation
- `task docs` - Generate comprehensive documentation using antsibull-docs
- `task docs:init` - Initialize antsibull-docs Sphinx structure
- `task docs:build` - Build documentation with antsibull-docs
- `task docs:lint` - Lint documentation for quality assurance

### Testing with Molecule
- `task test` - Run full molecule test suite using Docker containers
- `task test:lima` - Run molecule tests using Lima VMs for macOS compatibility
- `task test:all` - Run all molecule test scenarios (Docker + Lima)
- `task test:create` - Create test instances without running tests
- `task test:converge` - Run test playbooks on existing instances
- `task test:verify` - Verify test results
- `task test:destroy` - Destroy test instances

### Cleanup
- `task clean` - Clean up all generated files and molecule artifacts
- `task clean:files` - Clean up generated files, caches, and virtual environments

## Architecture

### Directory Structure
- `roles/` - Ansible Galaxy-compatible roles for specific functionality
- `playbooks/` - Ansible playbooks that orchestrate roles
- `molecule/` - Molecule testing scenarios (default uses Docker, lima uses VMs)
- `inventory.yml` - Ansible inventory with homelab hosts and localhost

### Key Roles
- `bootstrap-*` - Series of roles for setting up development environments (foundation, secrets, cli-tools, dotfiles, validation)
- `node_exporter` - Prometheus monitoring setup
- `molecule-test` - Testing framework role
- `direct-nas`, `dropbox-symlinks`, `hostname-manager` - System configuration utilities
- `nfs-homelab`, `nvchad` - Infrastructure and development tools

### Testing Framework
Uses Molecule with two scenarios:
- **default**: Docker containers for Linux testing (Ubuntu 20.04/22.04)
- **lima**: Lima VMs for macOS-compatible testing with x86_64 emulation

### Environment Variables Required
- `ANSIBLE_PASSWORD` - SSH password for remote hosts
- `ANSIBLE_BECOME_PASSWORD` - Sudo password for privilege escalation
- `CATALYST_SSH_PASS` - SSH password for homelab hosts
- `CATALYST_BECOME_PASS` - Become password for homelab hosts

## Development Workflow

1. Install dependencies: `task deps`
2. Set required environment variables for your target hosts
3. Develop/modify roles in `roles/` directory
4. Create/modify playbooks in `playbooks/` directory
5. Test changes: `task test` (Docker) or `task test:lima` (VMs)
6. Generate documentation: `task docs` (uses antsibull-docs framework)
7. Run against real infrastructure: `task play -- <playbook_name>`
8. For bootstrap development: `task bootstrap:test` for safe testing

## Inventory Management

The `inventory.yml` file defines:
- `localhost` - Local development machine
- `homelab` group - Contains truenas00, syno00, nuc00 for homelab infrastructure
- Environment variable integration for sensitive credentials

## Dependencies

**Python packages** managed through Poetry (pyproject.toml):
- Ansible 11.5+ with ansible-core 2.18+
- Molecule 25.4+ with Docker and lint support
- ansible-lint, ansible-dev-tools for development
- antsibull-docs for documentation generation

**Ansible collections** managed through requirements.yml:
- community.general, ansible.posix, community.crypto
- Versions are aligned with Ansible 11.x compatibility
- Both files should be kept in sync to prevent dependency drift