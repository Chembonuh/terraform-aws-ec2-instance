output "instance_id" {
  value       = aws_instance.web_server.id
  description = "ID of the EC2 instance"
}

output "public_ip" {
  value       = aws_instance.web_server.public_ip
  description = "Public IP of the EC2 instance"
}
