provider "aws" {
  region = var.region
}

module "ec2_instance" {
  source        = "./modules/ec2-instance"  # Path to your module
  instance_ami  = var.instance_ami          # AMI ID passed as a variable
  region        = var.region                # AWS region
  instance_type = var.instance_type         # Instance type
  key_name      = var.key_name              # Key pair for the instance
  volume_size   = var.volume_size           # Volume size

  tags = var.tags                           # Tags for the EC2 instance
}
