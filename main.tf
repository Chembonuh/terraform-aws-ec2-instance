terraform {
  required_version = ">= 1.3.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "chem"

    workspaces {
      name = "terraform-aws-ec2-instance"
    }
  }
}

provider "aws" {
  region = var.region
}


provider "aws" {
  region = var.region
}

resource "aws_instance" "web_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  ebs_block_device {
    device_name = "/dev/sdh"
    volume_size = var.volume_size
  }

  tags = var.tags
}
