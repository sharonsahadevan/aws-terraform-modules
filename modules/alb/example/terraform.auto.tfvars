# alb
create_lb                        = true
drop_invalid_header_fields       = false
enable_cross_zone_load_balancing = true
enable_deletion_protection       = false
enable_http2                     = true
idle_timeout                     = 60
ip_address_type                  = "ipv4"
listener_ssl_policy_default      = "ELBSecurityPolicy-2016-08"
load_balancer_create_timeout     = "10m"
load_balancer_delete_timeout     = "10m"
load_balancer_type               = "application"
load_balancer_update_timeout     = "10m"