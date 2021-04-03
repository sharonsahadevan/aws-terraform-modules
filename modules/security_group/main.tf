module "security_group" {
  source                                = "terraform-aws-modules/security-group/aws"
  version                               = "~> 3.0"
  name                                  = var.name
  description                           = var.description
  ingress_with_cidr_blocks              = var.ingress_with_cidr_blocks
  vpc_id                                = var.vpc_id
  egress_cidr_blocks                    = var.egress_cidr_blocks
  egress_rules                          = var.egress_rules
  ingress_with_source_security_group_id = var.ingress_with_source_security_group_id
  ingress_with_self                     = var.ingress_with_self

}

