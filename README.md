## EC2 Instance Module

This module provisions EC2 instances with customizable parameters.

### Usage
```hcl
module "ec2" {
  source        = "./modules/ec2-instance"
  region        = "us-east-2"
  instance_ami  = "ami-12345678"
  instance_type = "t2.micro"
  volume_size   = 40
  key_name      = "my-key"
  tags          = {
    Name        = "my-webserver"
    Environment = "Development"
  }
}

