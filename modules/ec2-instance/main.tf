terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "chem"

    workspaces {
      name = "ec2-instance"
    }
  }
}

module "ec2_instance" {
  source  = "app.terraform.io/chem/ec2-instance"
  version = "1.0.0"

  region        = var.region
  instance_ami  = var.instance_ami
  instance_type = var.instance_type
  volume_size   = var.volume_size
  tags          = var.tags
  key_name      = var.key_name
}
