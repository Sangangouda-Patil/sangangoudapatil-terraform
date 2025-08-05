# IAM User Management with Terraform

This configuration:

- Reads a YAML file containing usernames and their roles.
- Creates IAM users dynamically.
- Generates strong random passwords.
- Attaches AWS managed IAM policies based on assigned roles.
- Exports credentials to a local `user_credentials.txt` file.

## Files

- **main.tf** – Full Terraform configuration
- **users.yaml** – List of users and their roles
- **.gitignore** – To prevent committing sensitive files
- **user_credentials.txt** – Generated credentials (auto-created after apply)

## Usage

1. Initialize Terraform:
   ```bash
   terraform init
   ```
