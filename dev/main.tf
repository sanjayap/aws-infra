terraform {
  required_version = ">=0.12.16"

  backend "s3" {
    bucket         = "tf-backend.test.com.au"
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "tf-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-southeast-2"
  # shared_credentials_file = "$HOME/.aws/credentials"
  # profile                 = "sanjayap-dev"
}

module "dev_vpc" {
  source                  = "../modules/aws_network"
  env                     = var.env
  vpc_cidr                = var.vpc_cidr
  public_subnets          = var.public_subnets
  private_app_subnets     = var.private_app_subnets
  private_db_subnets      = var.private_db_subnets
}

module "app_server" {
  source        = "../modules/aws_server"
  env           = var.env
  name          = "app-01"
  subnet_id     = module.dev_vpc.private_app_subnet_ids[var.private_app_subnets["ap-southeast-2a"]]
  root_disksize = "20"
  depends_on    = [module.dev_vpc]
}
