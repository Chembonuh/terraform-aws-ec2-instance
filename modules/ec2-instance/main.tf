# Terraform Backend Configuration
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "chem" # Replace with your Terraform Cloud organization

    workspaces {
      name = "terraform-aws-ec2-instance" # Replace with your Terraform Cloud workspace name
    }
  }
}

# AWS Provider Configuration
provider "aws" {
  region = var.region
}

# AWS EC2 Instance Resource
resource "aws_instance" "example" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  # EBS Block Device Configuration
  ebs_block_device {
    device_name = "/dev/sdh"
    volume_size = var.volume_size
  }

  # Tags for the EC2 Instance
  tags = var.tags
}
