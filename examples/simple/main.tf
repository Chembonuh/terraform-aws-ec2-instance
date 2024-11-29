module "ec2_instance" {
  source        = "../../modules/ec2-instance"
  instance_ami  = "ami-0c11a84584d4e09dd" # Match module's variable name
  region        = "us-east-2"
  instance_type = "t2.micro"
  key_name      = "my-key-pair"
  volume_size   = 40                      # Required by the module

  tags = {
    Name        = "ExampleInstance"
    Environment = "Test"
  }
}
