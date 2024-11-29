variable "region" {
  description = "AWS region for the instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key to use"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
}
