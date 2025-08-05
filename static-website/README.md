# Exercise 03 - Host a Static Website on AWS S3 using Terraform

This project provisions a **static website** on **AWS S3** using Terraform.  
It also configures **remote state storage** in an S3 backend for collaborative and persistent state management.

---

## **Features**

- **S3 bucket** for hosting a static website.
- **Unique bucket naming** using `random_id` to avoid conflicts.
- **Public access policy** for serving files to the web.
- **Uploads HTML & CSS** files (`index.html` & `style.css`).
- **Static website hosting** with an index document.
- **Remote backend** for Terraform state (stored in a separate S3 bucket).

---
