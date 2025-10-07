terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  
  default_tags {
    tags = {
      Project     = "socaas"
      Environment = "dev"
      ManagedBy   = "terraform"
    }
  }
}

# Simple VPC configuration
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "socaas-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "socaas-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "socaas-public-subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "socaas-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Security Group for Honeypot
resource "aws_security_group" "honeypot" {
  name        = "socaas-honeypot-sg"
  description = "Security group for honeypot EC2 instance"
  vpc_id      = aws_vpc.main.id

  # SSH - intentionally open to attract attackers
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP - for our dashboard
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS - for secure dashboard
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "socaas-honeypot-sg"
  }
}

# EC2 Instance
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "honeypot" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.honeypot.id]
  key_name               = aws_key_pair.socaas_key.key_name

  user_data = filebase64("${abspath(path.module)}/../../../scripts/user_data.sh")

  tags = {
    Name = "socaas-honeypot"
    Role = "honeypot"
  }
}

resource "aws_key_pair" "socaas_key" {
  key_name   = "socaas-key"
  public_key = file("${abspath(path.module)}/../../../scripts/socaas_key.pub")
}

# CloudWatch Log Group for security events
resource "aws_cloudwatch_log_group" "security_events" {
  name              = "/socaas/security-events"
  retention_in_days = 30

  tags = {
    Name = "socaas-security-events"
  }
}

# Outputs
output "honeypot_public_ip" {
  description = "Public IP of the honeypot instance"
  value       = aws_instance.honeypot.public_ip
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "cloudwatch_log_group" {
  description = "CloudWatch log group for security events"
  value       = aws_cloudwatch_log_group.security_events.name
}
