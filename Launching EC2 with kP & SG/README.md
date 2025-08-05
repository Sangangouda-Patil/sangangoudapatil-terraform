# Exercise 02 - EC2 with Key Pair & Security Group

This exercise launches an **Ubuntu EC2 instance** with:

- A custom **key pair** for SSH access.
- A **security group** allowing:
  - SSH from a specific IP.
  - HTTP (port 80) from anywhere.

## Files

- `main.tf` → EC2 instance configuration
- `ami.tf` → Fetches the latest Ubuntu AMI
- `keypair.tf` → Key pair resource
- `security.tf` → Security group rules
- `outputs.tf` → Outputs (AMI ID, instance ID, public IP)

## Usage

1. Create a key pair file:
   ```bash
   nano dove-key.pub
   ```
