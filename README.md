# terraform-modules
2. Modules Directory
modules/vpc:

Contains everything needed to manage a VPC.
Example contents:
main.tf: Defines VPC resources (e.g., aws_vpc, aws_subnet).
variables.tf: Defines variables specific to the VPC module (e.g., cidr, vpc_name).
outputs.tf: Outputs VPC-related attributes (e.g., vpc_id, subnet_ids).
modules/ec2-instance:

Contains configurations for EC2 instances.
Example contents:
main.tf: Defines EC2 instance resources (aws_instance).
variables.tf: Defines variables like instance_type, ami_id, etc.
outputs.tf: Outputs EC2-related attributes (instance_id, public_ip).
