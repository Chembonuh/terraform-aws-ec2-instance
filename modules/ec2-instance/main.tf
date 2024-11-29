terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "chem"

    workspaces {
      name = "ec2-instance"
    }
  }
}

provider "aws" {
  region = var.region
}

module "ec2_instance" {
  source        = "./modules/ec2-instance"
  region        = var.region
  instance_ami  = var.instance_ami
  instance_type = var.instance_type
  volume_size   = var.volume_size
  tags          = var.tags
  key_name      = var.key_name
}
