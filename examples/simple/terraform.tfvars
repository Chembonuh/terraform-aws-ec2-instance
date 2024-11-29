region        = "us-east-2"
instance_ami  = "ami-0c11a84584d4e09dd"  # Matches the updated variable
instance_type = "t2.micro"
key_name      = "my-key-pair"
volume_size   = 40

tags = {
  Name        = "ExampleInstance"
  Environment = "Test"
}
