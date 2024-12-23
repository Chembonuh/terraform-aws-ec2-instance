variable "region" {
  description = "AWS region for the instance"
  type        = string
  default     = "us-east-2"
}

variable "instance_ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0010f97cebdb3afbb #ami-0c11a84584d4e09dd"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The SSH key name for accessing the instance"
  type        = string
  default     = "wahala"
}

variable "volume_size" {
  description = "The size of the EBS volume (GB)"
  type        = number
  default     = 40
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0010f97cebdb3afbb" # Replace with your desired default value
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default = {
    Name        = "web_server"
    Environment = "Production"
  }
}
