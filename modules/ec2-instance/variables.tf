variable "region" {
  description = "AWS region for the instance"
  type        = string
}

variable "instance_ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The SSH key name for accessing the instance"
  type        = string
}

variable "volume_size" {
  description = "The size of the EBS volume (GB)"
  type        = number
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {
    Name        = "DefaultInstance"
    Environment = "Development"
  }
}
