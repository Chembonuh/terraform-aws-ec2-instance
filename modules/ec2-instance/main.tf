module "ec2_instance" {
  source  = "app.terraform.io/chem/ec2-instance"
  version = "1.0.0"

  region        = var.region
  instance_ami  = var.instance_ami
  instance_type = var.instance_type
  volume_size   = var.volume_size
  tags          = var.tags
  key_name      = var.key_name
}
