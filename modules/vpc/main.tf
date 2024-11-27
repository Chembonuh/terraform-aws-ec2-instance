module "vpc" {
  source = "./modules/vpc"

  vpc_name = "my-vpc"
  cidr     = "10.0.0.0/16"
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "my-s3-bucket"
  region      = "us-west-2"
}
