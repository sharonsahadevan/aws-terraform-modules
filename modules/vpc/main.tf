data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.70.0"

  name                    = "${var.app_name}_${var.environment}_vpc"
  cidr                    = var.cidr
  azs                     = [data.aws_availability_zones.available.names[0],data.aws_availability_zones.available.names[1]]
  private_subnets         = var.private_subnets
  public_subnets          = var.public_subnets
  enable_nat_gateway      = var.enable_nat_gateway
  single_nat_gateway      = var.single_nat_gateway
  enable_dns_hostnames    = var.enable_dns_hostnames
  enable_s3_endpoint      = var.enable_s3_endpoint
  one_nat_gateway_per_az  = var.one_nat_gateway_per_az
  tags                    = var.tags 
  public_subnet_tags      = var.public_subnet_tags
  private_subnet_tags     = var.private_subnet_tags
}
