# alb
module "alb" {
  source      = "terraform-aws-modules/alb/aws"
  version     = "5.12.0"
  name        = var.name
  #name_prefix = var.name_prefix
  # access_logs                      = var.access_logs // need to enable after S3 bucket is created. Refer the README.md for more information
  subnets                          = [module.vpc.public_subnets[0],module.vpc.public_subnets[1]]
  vpc_id                           = module.vpc.vpc_id
  create_lb                        = var.create_lb
  drop_invalid_header_fields       = var.drop_invalid_header_fields
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.enable_http2
  extra_ssl_certs                  = var.extra_ssl_certs
  http_tcp_listeners               = var.http_tcp_listeners
  https_listener_rules             = var.https_listener_rules
  https_listeners                  = var.https_listeners
  idle_timeout                     = var.idle_timeout
  internal                         = var.internal
  ip_address_type                  = var.ip_address_type
  lb_tags                          = var.lb_tags
  listener_ssl_policy_default      = var.listener_ssl_policy_default
  load_balancer_create_timeout     = var.load_balancer_create_timeout
  load_balancer_delete_timeout     = var.load_balancer_delete_timeout
  security_groups                  = var.security_groups
  tags                             = var.alb_tags
  target_group_tags                = var.target_group_tags
  target_groups                    = var.target_groups


}
