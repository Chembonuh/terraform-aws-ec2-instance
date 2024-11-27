variable "region" {
  default     = "us-east-1"
  description = "AWS region to deploy resources in."
}

variable "vpc_name" {
  default     = "my-vpc"
  description = "Name of the VPC."
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC."
}

variable "subnet_cidr" {
  default     = "10.0.1.0/24"
  description = "CIDR block for the public subnet."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Instance type for EC2."
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance."
}
