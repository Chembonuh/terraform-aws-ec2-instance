terraform {
  backend "remote" {
    hostname     = "app.terraform.io"         # Terraform Cloud endpoint
    organization = "chem"                     # Terraform Cloud organization

    workspaces {
      name = "terraform-aws-ec2-instance"     # Terraform Cloud workspace name
    }
  }
}

provider "aws" {
  region = var.region                         # AWS region passed as a variable
}

module "ec2_instance" {
  source        = "${path.root}/modules/ec2-instance"  # Use path.root for proper resolution
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
