region        = "us-east-2"
instance_ami  = "ami-0c80e2b6ccb9ad6d1"  # Matches the updated variable
instance_type = "t2.micro"
key_name      = "wahala"
volume_size   = 40

tags = {
  Name        = "web_server2"
  Environment = "Test"
}
