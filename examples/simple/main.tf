module "ec2_instance" {
  source  = "../../modules/ec2-instance"
  ami_id  = "ami-0c11a84584d4e09dd"
  region  = "us-east-2"
  instance_type = "t2.micro"
  key_name = "my-key-pair"

  tags = {
    Name        = "ExampleInstance"
    Environment = "Test"
  }
}
