terraform {
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

module "ec2_instance" {
  source        = "../../modules/ec2-instance"
  instance_ami  = var.instance_ami
  region        = var.region
  instance_type = var.instance_type
  key_name      = var.key_name
  volume_size   = var.volume_size

  tags = var.tags
}
