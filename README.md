# 🛡️ SOCaaS - Security Operations Center as a Service

## 🌐 Live Project

**[Main Landing Page](https://socaas-dashboards-h1hn99gpf-ajalmohammads-projects.vercel.app)** - Complete Project Overview & Interactive Dashboards

---

## 📊 Live Dashboards

- **[Security Operations Dashboard](https://aj-almohammad.github.io/SOCaaS---Security-Operations-Center-as-a-Service-DevOps-Portfolio/security-dashboard.html)** - Real-time Security Monitoring & DevOps Pipeline Status
- **[AWS Services Dashboard](https://aj-almohammad.github.io/SOCaaS---Security-Operations-Center-as-a-Service-DevOps-Portfolio/aws-services-dashboard.html)** - Infrastructure Overview & Cloud Services Utilization

---

## 🎯 Project Overview

SOCaaS is a comprehensive DevOps security project demonstrating automated security monitoring, infrastructure as code, and continuous deployment pipelines. This project showcases the skills required for a DevOps Specialist role in a Cyber Defense Center.

### 🎖️ Job Role Alignment

This project directly addresses the **DevOps Specialist - Cyber Defense Center** requirements:

- ✅ **Ansible** - [Automated honeypot configuration](ansible/honeypot-setup.yml)
- ✅ **Python Scripting** - [Security analysis and monitoring](scripts/security_analyzer.py)
- ✅ **OpenShift/Kubernetes** - [Container orchestration setup](kubernetes/)
- ✅ **Virtual Machines** - [EC2 honeypot instances](terraform/environments/dev/main.tf)
- ✅ **DevOps Development** - [Infrastructure automation and CI/CD](terraform/)
- ✅ **Cloud Services** - [AWS infrastructure automation](terraform/environments/dev/main.tf)

---

## 🏗️ Architecture

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

## 📁 Project Structure

### Infrastructure as Code

**Terraform Configuration:**
- **[Main Infrastructure](terraform/environments/dev/main.tf)** - VPC, EC2, Security Groups, CloudWatch
- **[VPC Module](terraform/modules/vpc/)** - Reusable network infrastructure components
  - [VPC Main Configuration](terraform/modules/vpc/main.tf)
  - [VPC Outputs](terraform/modules/vpc/outputs.tf)
  - [VPC Variables](terraform/modules/vpc/variables.tf)

**Components:**
- **VPC Networking** - Isolated cloud network environment
- **EC2 Honeypot** - Security monitoring instance
- **Security Groups** - Controlled access policies and firewall rules
- **CloudWatch Logging** - Centralized security event logging

### Automation & Configuration

**Ansible Playbooks:**
- **[Honeypot Setup](ansible/honeypot-setup.yml)** - Complete automated server configuration
- **[Inventory Configuration](ansible/inventory.ini)** - Host management and grouping

**Features:**
- **Automated Deployment** - One-command server provisioning
- **Security Monitoring** - Real-time threat detection services
- **Service Management** - Systemd services and health monitoring

### Security Scripting

**Python Security Tools:**
- **[Security Analyzer](scripts/security_analyzer.py)** - Advanced security event processing
- **[User Data Script](scripts/user_data.sh)** - EC2 instance initialization

**Capabilities:**
- **Event Processing** - Parse and analyze security logs
- **Pattern Detection** - Identify brute force attacks and anomalies
- **Dashboard Generation** - Automated security reporting

### Container Orchestration

**Kubernetes Setup:**
- **[Kubernetes Configurations](kubernetes/)** - Container orchestration manifests (planned/simulated)

---

## 🚀 Quick Start

### Prerequisites

- AWS Account with CLI configured
- Terraform 1.0+
- Python 3.8+
- Ansible 2.9+

### Step 1: Infrastructure Deployment

```bash
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
```

**Files involved:**
- [terraform/environments/dev/main.tf](terraform/environments/dev/main.tf)
- [terraform/modules/vpc/main.tf](terraform/modules/vpc/main.tf)

### Step 2: Ansible Configuration

```bash
cd ansible
# Update inventory.ini with your EC2 IP address
ansible-playbook -i inventory.ini honeypot-setup.yml
```

**Files involved:**
- [ansible/honeypot-setup.yml](ansible/honeypot-setup.yml)
- [ansible/inventory.ini](ansible/inventory.ini)

### Step 3: Security Monitoring

```bash
cd scripts
python3 security_analyzer.py
```

**Files involved:**
- [scripts/security_analyzer.py](scripts/security_analyzer.py)

### Step 4: View Dashboards

Access the live interactive dashboards:
- [Security Operations Dashboard](https://aj-almohammad.github.io/SOCaaS---Security-Operations-Center-as-a-Service-DevOps-Portfolio/security-dashboard.html)
- [AWS Services Dashboard](https://aj-almohammad.github.io/SOCaaS---Security-Operations-Center-as-a-Service-DevOps-Portfolio/aws-services-dashboard.html)

---

## 🛠️ AWS Services Utilized

| Service | Purpose | Configuration |
|---------|---------|---------------|
| **EC2** | Honeypot Instance | [main.tf](terraform/environments/dev/main.tf) |
| **VPC** | Network Isolation | [vpc/main.tf](terraform/modules/vpc/main.tf) |
| **IAM** | Security & Access Management | [main.tf](terraform/environments/dev/main.tf) |
| **CloudWatch** | Logging & Monitoring | [main.tf](terraform/environments/dev/main.tf) |
| **Security Groups** | Firewall Rules | [main.tf](terraform/environments/dev/main.tf) |

---

## 📈 Security Features

### 🔍 Threat Detection

- **SSH Brute Force Monitoring** - Real-time attack detection
- **Security Event Analysis** - Automated log processing via [security_analyzer.py](scripts/security_analyzer.py)
- **Automated Alerting** - CloudWatch-based notification system

### 🛡️ Defense Mechanisms

- **Intentional Honeypot Exposure** - Controlled attack surface for monitoring
- **Security Group Best Practices** - Least privilege access control
- **Centralized Logging** - All security events aggregated in CloudWatch
- **Automated Configuration** - Consistent security posture via [Ansible](ansible/honeypot-setup.yml)

### 📊 Reporting & Analytics

- **[Interactive Security Dashboard](https://aj-almohammad.github.io/SOCaaS---Security-Operations-Center-as-a-Service-DevOps-Portfolio/security-dashboard.html)** - Real-time metrics visualization
- **[AWS Services Dashboard](https://aj-almohammad.github.io/SOCaaS---Security-Operations-Center-as-a-Service-DevOps-Portfolio/aws-services-dashboard.html)** - Infrastructure health monitoring
- **Compliance Reporting** - Automated security posture documentation
- **Incident Response** - Event correlation and analysis

---

## 🔄 DevOps Practices Demonstrated

### Infrastructure as Code

- **Modular Terraform Design** - Reusable [VPC module](terraform/modules/vpc/) for infrastructure components
- **Version-Controlled Infrastructure** - All infrastructure defined in Git
- **Automated Provisioning** - One-command deployment via [Terraform](terraform/environments/dev/main.tf)
- **State Management** - Terraform state tracking and change management

### Configuration Management

- **Ansible Automation** - Declarative server configuration via [playbooks](ansible/honeypot-setup.yml)
- **Idempotent Operations** - Consistent, repeatable deployments
- **Inventory Management** - Organized host grouping in [inventory.ini](ansible/inventory.ini)
- **Role-Based Organization** - Structured automation workflows

### Security Automation

- **Automated Security Analysis** - Python-based threat detection in [security_analyzer.py](scripts/security_analyzer.py)
- **Continuous Monitoring** - Real-time event processing
- **Scripted Deployments** - Automated setup via [user_data.sh](scripts/user_data.sh)
- **Dashboard Automation** - Self-updating security visualizations

### Container Orchestration

- **Kubernetes Ready** - [Container orchestration structure](kubernetes/) for scalable deployments
- **Microservices Architecture** - Prepared for containerized workloads
- **Cloud-Native Practices** - Modern deployment strategies

---

## 🎯 Skills Demonstrated

### Cloud Engineering

- **Multi-Service AWS Architecture** - Comprehensive cloud infrastructure design
- **Infrastructure as Code** - Expert-level Terraform implementation in [terraform/](terraform/)
- **Cloud Security Best Practices** - Defense-in-depth security model
- **Resource Optimization** - Efficient cloud resource utilization

### DevOps Automation

- **CI/CD Pipeline Development** - Automated deployment workflows
- **Configuration Management** - Ansible-based automation in [ansible/](ansible/)
- **Container Orchestration** - Kubernetes concepts and setup in [kubernetes/](kubernetes/)
- **Scripting & Automation** - Python security tools in [scripts/](scripts/)

### Security Operations

- **Threat Detection & Monitoring** - Real-time security event analysis
- **Honeypot Deployment** - Controlled attack surface for intelligence gathering
- **Security Incident Response** - Automated detection and alerting
- **Compliance & Reporting** - Interactive [security dashboards](https://aj-almohammad.github.io/SOCaaS---Security-Operations-Center-as-a-Service-DevOps-Portfolio/security-dashboard.html)

---

## 📂 Repository Structure

```
socaas-project/
├── terraform/
│   ├── environments/
│   │   └── dev/
│   │       └── main.tf              # Main infrastructure configuration
│   └── modules/
│       └── vpc/
│           ├── main.tf              # VPC module configuration
│           ├── outputs.tf           # VPC outputs
│           └── variables.tf         # VPC variables
├── ansible/
│   ├── honeypot-setup.yml           # Server configuration playbook
│   └── inventory.ini                # Ansible inventory
├── scripts/
│   ├── security_analyzer.py         # Security analysis tool
│   └── user_data.sh                 # EC2 initialization script
├── kubernetes/                      # Container orchestration configs
├── aws-services-dashboard.html      # Infrastructure dashboard
├── security-dashboard.html          # Security operations dashboard
└── README.md                        # Project documentation
```

---

## 📞 Contact Information

- **GitHub:** [AJ-Almohammad](https://github.com/AJ-Almohammad)
- **LinkedIn:** [Amer Almohammad](https://linkedin.com/in/amer-almohammad)
- **Email:** ajaber1973@web.de
- **Project Repository:** [SOCaaS DevOps Portfolio](https://github.com/AJ-Almohammad/SOCaaS---Security-Operations-Center-as-a-Service-DevOps-Portfolio)

---

## 📄 License

This project is for educational and demonstration purposes as part of a job application process.

---

**Built with ❤️ for modern DevOps security practices.**

*Demonstrating expertise in Cloud Infrastructure, Security Operations, and DevOps Automation.*