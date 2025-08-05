# Exercise 05 - EC2 with Provisioning

This project provisions:

- **EC2 instance** with a key pair.
- **Security group** allowing SSH & HTTP.
- **Remote provisioning** (uploads & executes a setup script).
- **Apache server** installation.

## Usage

1. Put your **public key** in `webapp-key.pub` and **private key** in `webappkey` (do not commit it).
2. Run:
   ```bash
   terraform init
   terraform apply
   ```
