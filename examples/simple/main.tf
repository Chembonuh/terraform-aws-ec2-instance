terraform {
  backend "remote" {
    hostname     = "app.terraform.io" # Terraform Cloud's endpoint
    organization = "chem"             # Your Terraform Cloud organization

    workspaces {
      name = "terraform-aws-ec2-instance" # Name of your Terraform Cloud workspace
    }
  }
}

provider "aws" {
  region = var.region # Region is passed as a variable
}

module "ec2_instance" {
  source        = "./modules/ec2-instance"
  region        = var.region
  instance_ami  = var.instance_ami
  instance_type = var.instance_type
  volume_size   = var.volume_size
  tags          = var.tags
}

