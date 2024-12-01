terraform {
  backend "remote" {
    hostname     = "app.terraform.io"         # Terraform Cloud's endpoint
    organization = "chem"                     # Your Terraform Cloud organization

    workspaces {
      name = "terraform-aws-ec2-instance"     # Name of your Terraform Cloud workspace
    }
  }
}

provider "aws" {
  region = var.region                         # Region is passed as a variable
}

module "ec2_instance" {
  source        = "../../modules/ec2-instance"    # Corrected relative path
  instance_ami  = "ami-0c11a84584d4e09dd"
  region        = "us-east-2"
  instance_type = "t2.micro"
  key_name      = "my-key-pair"
  volume_size   = 40

  tags = {
    Name        = "ExampleInstance"
    Environment = "Test"
  }
}
