region        = "us-east-2"
instance_ami  = "ami-0c11a84584d4e09dd" # Matches the module's variable
instance_type = "t2.micro"
key_name      = "my-key-pair"
volume_size   = 40                     # Required variable for volume size

tags = {
  Name        = "ExampleInstance"
  Environment = "Test"
}
