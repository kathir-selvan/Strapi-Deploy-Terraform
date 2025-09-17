# Strapi-Terraform

Terraform project to deploy **Strapi v4 (headless CMS)** on AWS EC2 using Ubuntu 22.04, Docker, and PM2.

---

## Project Overview

This repository provisions the following on AWS using Terraform:

- **VPC** with a public subnet and Internet Gateway  
- **Security Group** allowing SSH (22) and Strapi (1337)  
- **Ubuntu 22.04 EC2 instance** running Strapi via Docker  
- Persistent Docker volume for Strapi data  

Once deployed, Strapi is accessible via your EC2 public IP:

