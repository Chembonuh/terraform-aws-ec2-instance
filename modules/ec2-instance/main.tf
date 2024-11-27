resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "example-instance"
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
