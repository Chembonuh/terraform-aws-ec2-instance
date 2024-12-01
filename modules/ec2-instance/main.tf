provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  ebs_block_device {
    device_name = "/dev/sdh"
    volume_size = var.volume_size
  }

  tags = var.tags
}

output "instance_id" {
  value       = aws_instance.example.id
  description = "ID of the EC2 instance"
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "Public IP of the EC2 instance"
}
