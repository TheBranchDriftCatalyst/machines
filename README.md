
# README

This is a repository that stores galaxy compatible ansible playbooks for low level machine provisioning and tasks.  
It also contains tools for managing and developmenet of raw .imgs and other

## Machines Stack

- Ansible + Ansible Galaxy
- Molecule ansible testing framework.

---

## TODO

- create test command/framework
- create github install framework (galaxy)

## Old Readme Stuff Below (to be removed/moved)

Generic base git template repository
Steps to provision a new system:

```mermaid
graph TD
    A[Start] --> B[Is this a remote provisioning]
    B -- Yes --> C[Decrypt file using sops]
    B -- No --> D[Install SSH]
    C --> E{Is it a JSON file?}
    D --> E{Is it a JSON file?}
    E -- Yes --> F[Process JSON file]
    E -- No --> G{Is it a YAML file?}
    G -- Yes --> H[Process YAML file]
    G -- No --> I[Unsupported file format]
    F --> J[Export environment variables]
    H --> J[Export environment variables]
    J --> K[Environment ready]
    K --> L[Run your application]
    L --> M[End]
```

- On the current machine (can be an ansible script)
  - Generate new ssh_key
  - Generate derived PGP key
  - armor both and add to ProvisionPackage.tar
  - upload provision package and add current machines ssh to

- New Machine

- generate ssh id_rsa key for new machine
- Install Python
- --- Install ansible immediately ---
- ansible scripts
-
