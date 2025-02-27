variable "region" {
  description = "AWS region for the instance"
  type        = string
  default     = "us-east-2"
}

variable "instance_ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0f29c3194a58968d0"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The SSH key name for accessing the instance"
  type        = string
  default     = "Ansible"
}

variable "volume_size" {
  description = "The size of the EBS volume (GB)"
  type        = number
  default     = 40
}
variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default = {
    Name        = "web_server"
    Environment = "Production"
  }
}

