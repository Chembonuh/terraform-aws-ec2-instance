# Terraform AWS EC2 Instance Module

This module provisions an AWS EC2 instance with customizable parameters.

## Usage

```hcl
module "ec2_instance" {
  source        = "app.terraform.io/chem/ec2-instance"
  version       = "1.0.0"

  region        = "us-east-2"
  instance_ami  = "ami-0c11a84584d4e09dd"
  instance_type = "t2.micro"
  volume_size   = 40
  tags = {
    Name        = "my-instance"
    Environment = "Production"
    Project     = "MyApp"
  }
  key_name = "my-key-pair"
}


Inputs
region: AWS region to deploy in (default: us-east-2).
instance_ami: The AMI ID for the instance.
instance_type: EC2 instance type (e.g., t2.micro).
volume_size: Size of the EBS volume in GB (default: 40).
tags: Tags to apply to the resources.
key_name: Name of the SSH key pair.
Outputs
instance_id: The ID of the web server instance.
instance_public_ip: The public IP address of the web server instance.
instance_volume_size: The size of the root volume.
Versioning
This module follows Semantic Versioning. The module versions are tagged as vX.Y.Z.

License
This module is licensed under the MIT License.


### **4. Adding Version Tags to the Repository**

Terraform Cloud requires version tags to properly manage modules. After committing your changes, tag your Git repository.

1. **Create a Version Tag**:

   ```bash
   git tag v1.0.0
   git push origin v1.0.0
