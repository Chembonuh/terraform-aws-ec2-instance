module "ec2_instance" {
  source  = "app.terraform.io/chem/ec2-instance/aws"
  version = "1.0.0"

  region        = "us-east-2"
  instance_ami  = "ami-0c11a84584d4e09dd"
  instance_type = "t2.micro"
  volume_size   = 40
  tags = {
    Name        = "my-instance"
    Environment = "Production"
    Project     = "MyApp"
  }
  key_name = "my-key-pair"
}
