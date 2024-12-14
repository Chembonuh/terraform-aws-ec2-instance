resource "aws_instance" "web_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  ebs_block_device {
    device_name = "/dev/sdh"
    volume_size = var.volume_size
  }

  tags = var.tags

  # Wait until the instance is ready before executing further tasks
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y || sudo yum update -y",
      "sudo apt-get install -y ansible || sudo yum install -y ansible"
    ]

    connection {
      type     = "ssh"
      user     = "ec2-user"        # Replace with the instance's default user
      private_key = file(var.ssh_private_key_path)
      host     = self.public_ip    # Use public or private IP based on your network setup
    }
  }

  # Trigger the job template after provisioning the instance
  provisioner "local-exec" {
    command = <<EOT
      curl -k -X POST \
        -H "Authorization: Bearer SJtNbEDTazjUAl9EjYQqj7GcfGSX2Q" \
        -H "Content-Type: application/json" \
        -d '{
              "extra_vars": {
                "instance_ip": "${self.private_ip}",
                "instance_id": "${self.id}"
              }
            }' \
        https://10.0.0.112:443/api/v2/job_templates/11/launch/
    EOT
  }
}
