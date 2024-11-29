variable "region" {
  description = "AWS region for the instance"
  type        = string
}

variable "instance_ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key to use for the instance"
  type        = string
}

variable "volume_size" {
  description = "The size of the EBS volume in GB"
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
