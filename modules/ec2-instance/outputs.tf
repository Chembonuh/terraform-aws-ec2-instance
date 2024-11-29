output "instance_id" {
  value       = aws_instance.example.id
  description = "ID of the EC2 instance"
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "Public IP of the EC2 instance"
}
