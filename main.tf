provider "aws" {
  region = "us-east-1"
}

module "s3_bucket_module_1" {
  source = "./s3_bucket"

  bucket_name = "gtech-s3-media"
  environment = "dev"
}

module "s3_bucket_module_2" {
  source = "./s3_bucket"

  bucket_name = "gtech-s3-code"
  environment = "dev"
}

module "networking" {
  source = "./networking"

tags = var.tags
cidr_vpc = var.cidr_vpc
cidr_prv1 = var.cidr_prv1
cidr_prv2 = var.cidr_prv2
cidr_pub1 = var.cidr_pub1
cidr_pub2 = var.cidr_pub2
project_name = var.project_name
environment = var.environment_name

}

