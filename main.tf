# Provider configuration
provider "aws" {
  region = var.region
}

# Call the VPC module
module "vpc" {
  source      = "./modules/vpc"
  vpc_name    = var.vpc_name
  cidr        = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

# Call the EC2 instance module
module "ec2_instance" {
  source        = "./modules/ec2-instance"
  instance_type = var.instance_type
  ami_id        = var.ami_id
  subnet_id     = module.vpc.public_subnet_id
}

# Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}
