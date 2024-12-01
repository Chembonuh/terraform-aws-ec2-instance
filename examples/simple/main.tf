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
<<<<<<< HEAD
  source        = "../../modules/ec2-instance"
  instance_ami  = var.instance_ami
  region        = var.region
  instance_type = var.instance_type
  key_name      = var.key_name
  volume_size   = var.volume_size

  tags = var.tags
=======
  source        = "./modules/ec2-instance"
  region        = var.region
  instance_ami  = var.instance_ami
  instance_type = var.instance_type
  volume_size   = var.volume_size
  key_name      = var.key_name
  tags          = var.tags
>>>>>>> origin/main
}
