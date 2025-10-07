# 🛡️ SOCaaS - Security Operations Center as a Service

## 📊 Live Dashboards

- **[Security Operations Dashboard](security-dashboard.html)** - Real-time Security Monitoring & DevOps Pipeline Status
- **[AWS Services Dashboard](aws-services-dashboard.html)** - Infrastructure Overview & Cloud Services Utilization

---

## 🎯 Project Overview

SOCaaS is a comprehensive DevOps security project demonstrating automated security monitoring, infrastructure as code, and continuous deployment pipelines. This project showcases the skills required for a DevOps Specialist role in a Cyber Defense Center.

### 🎖️ Job Role Alignment

This project directly addresses the **DevOps Specialist - Cyber Defense Center** requirements:

- ✅ **Ansible** - Automated honeypot configuration
- ✅ **Python Scripting** - Security analysis and monitoring
- ✅ **OpenShift/Kubernetes** - EKS cluster configuration (simulated)
- ✅ **Virtual Machines** - EC2 honeypot instances
- ✅ **DevOps Development** - GitHub Actions CI/CD pipelines
- ✅ **Cloud Services** - AWS infrastructure automation

---

## Architecture

```
┌─────────────────┐     ┌──────────────────┐     ┌─────────────────┐
│ GitHub Actions  │     │   AWS Cloud      │     │   Security      │
│  CI/CD Pipeline │────▶│ Infrastructure   │────▶│   Monitoring    │
└─────────────────┘     └──────────────────┘     └─────────────────┘
        │                       │                         │
        │                       │                         │
        ▼                       ▼                         ▼
┌─────────────────┐     ┌──────────────────┐     ┌─────────────────┐
│   Terraform     │     │  EC2 Honeypot    │     │   CloudWatch    │
│ Infrastructure  │     │  with Ansible    │     │    Logging      │
└─────────────────┘     └──────────────────┘     └─────────────────┘
```

---

## Project Structure

### Infrastructure as Code
**Location:** `terraform/environments/dev/main.tf`

- **VPC Networking** - Isolated cloud network
- **EC2 Honeypot** - Security monitoring instance
- **Security Groups** - Controlled access policies
- **CloudWatch Logging** - Centralized security events

### Automation & Configuration
**Location:** `ansible/honeypot-setup.yml`

- **Ansible Playbooks** - Automated server configuration
- **Security Monitoring** - Real-time threat detection
- **Service Management** - Systemd services and monitoring

### Security Scripting
**Location:** `scripts/security_analyzer.py`

- **Python Analysis** - Security event processing
- **Pattern Detection** - Brute force identification
- **Dashboard Generation** - Security reporting

### CI/CD Pipeline
**Location:** `.github/workflows/socaas-pipeline.yml`

- **Automated Testing** - Infrastructure validation
- **Security Scanning** - Vulnerability assessment
- **Deployment Automation** - Environment management

---

## Quick Start

### Prerequisites

- AWS Account with CLI configured
- Terraform 1.0+
- Python 3.8+
- Ansible 2.9+

### Step 1: Infrastructure Deployment

```bash
cd terraform/environments/dev
terraform init
terraform apply
```

### Step 2: Ansible Configuration

```bash
cd ansible
# Update inventory.ini with your EC2 IP
ansible-playbook -i inventory.ini honeypot-setup.yml
```

### Step 3: Security Monitoring

```bash
cd scripts
python3 security_analyzer.py
```

### Step 4: CI/CD Setup

1. Fork this repository
2. Add AWS credentials to GitHub Secrets
3. Push to trigger automated pipelines

---

## AWS Services Utilized

| Service | Purpose | Configuration |
|---------|---------|---------------|
| EC2 | Honeypot Instance | `terraform/environments/dev/main.tf` |
| VPC | Network Isolation | `terraform/environments/dev/main.tf` |
| IAM | Security & Access | `terraform/environments/dev/main.tf` |
| CloudWatch | Logging & Monitoring | `terraform/environments/dev/main.tf` |
| EKS | Container Orchestration | `terraform/modules/` |

---

## Security Features

### Threat Detection

- SSH brute force monitoring
- Real-time security event analysis
- Automated alerting system

### Defense Mechanisms

- Intentional honeypot exposure
- Security group best practices
- Centralized logging and monitoring

### Reporting & Analytics

- Automated security dashboards
- Compliance reporting
- Incident response documentation

---

## DevOps Practices Demonstrated

### Infrastructure as Code

- Terraform modules for reusable components
- Version-controlled infrastructure
- Automated provisioning and destruction

### Continuous Integration

- GitHub Actions workflows
- Automated testing and validation
- Security scanning integration

### Security Automation

- Ansible for configuration management
- Python scripts for security analysis
- Automated deployment pipelines

---

## Skills Demonstrated

### Cloud Engineering

- Multi-service AWS architecture
- Infrastructure as Code with Terraform
- Cloud security best practices

### DevOps Automation

- CI/CD pipeline development
- Configuration management with Ansible
- Container orchestration concepts

### Security Operations

- Threat detection and monitoring
- Security incident response
- Compliance and reporting

---

## Contact Information

- **GitHub:** AJ-Almohammad
- **LinkedIn:** Amer Almohammad
- **Email:** ajaber1973@web.de

---

## License

This project is for educational and demonstration purposes as part of a job application process.

**Built with ❤️ for modern DevOps security practices.**