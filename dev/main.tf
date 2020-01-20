terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "s3-backend-state"
    key    = "state/mid-project/dev-env/dev-net.tfstate"
    region = "us-east-1"
  }
}

module "vpc" {
  source = "../modules/vpc"
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone
  public-instance-id = module.compute.web-instance
}

module "compute" {
  source = "../modules/compute"
  ec2_type = var.ec2_type
  private_subnet = module.vpc.privare_subnet
  public_subnet = module.vpc.public_subnet
  private_sg = module.vpc.private_sg
  public_sg = module.vpc.public_sg
  availability_zone = var.availability_zone
}