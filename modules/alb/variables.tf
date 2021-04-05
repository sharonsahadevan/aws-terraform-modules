variable "name"{
    type = string
    description = "The resource name and Name tag of the load balancer."
}

variable "name_prefix" {
    type = string 
    description = "The resource name prefix and Name tag of the load balancer. Cannot be longer than 6 characters"
  
}

variable "subnets" {
  type = list(string)
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
}

variable "vpc_id"{
    type = string
    description = "VPC id where the load balancer and other resources will be deployed"
}

variable "access_logs"{
    type = map(string)
    description = "Map containing access logging configuration for load balancer."
}

variable "create_lb " {
    type = bool
    description = "Controls if the Load Balancer should be created"
  
}

variable "drop_invalid_header_fields " {
    type = bool 
    description = "Indicates whether invalid header fields are dropped in application load balancers. Defaults to false"

  
}

variable "enable_cross_zone_load_balancing " {
    type = bool
    description = "Indicates whether cross zone load balancing should be enabled in application load balancers."
  
}

variable "enable_deletion_protection"{
    type = bool 
    description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false"
}

variable "enable_http2 " {
  type = bool
  description = "Indicates whether HTTP/2 is enabled in application load balancers."
}

variable "extra_ssl_certs" {
    type = list(map(string))
    description = "A list of maps describing any extra SSL certificates to apply to the HTTPS listeners. Required key/values: certificate_arn, https_listener_index (the index of the listener within https_listeners which the cert applies toward)"
  
}

variable "http_tcp_listeners "{
    type  = any
    description = "A list of maps describing the HTTP listeners or TCP ports for this ALB. Required key/values: port, protocol. Optional key/values: target_group_index (defaults to http_tcp_listeners[count.index])"
}

variable "https_listener_rules " {
    type = any
    description = "A list of maps describing the Listener Rules for this ALB. Required key/values: actions, conditions. Optional key/values: priority, https_listener_index (default to https_listeners[count.index])"
  
}

variable "https_listeners"{
    type = any
    description = "A list of maps describing the HTTPS listeners for this ALB. Required key/values: port, certificate_arn. Optional key/values: ssl_policy (defaults to ELBSecurityPolicy-2016-08), target_group_index (defaults to https_listeners[count.index])"
}

variable "idle_timeout" {
    type = number
    description = "The time in seconds that the connection is allowed to be idle."
  
}

variable "internal" {
    type = bool
    description = "Boolean determining if the load balancer is internal or externally facing"
  
}

variable "ip_address_type"{
    type = "string"
    description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack."
}

variable "lb_tags" {
    type = map(string)
    description = "A map of tags to add to load balancer"
  
}

variable "listener_ssl_policy_default" {
    type = string
    description = "The security policy if using HTTPS externally on the load balancer. [See](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-policy-table.html)"
  
}

variable "load_balancer_create_timeout " {
    type = string
    description = "Timeout value when creating the ALB."
  
}

variable "load_balancer_delete_timeout " {
    type = string
    description = "Timeout value when deleting the ALB."
  
}

variable "load_balancer_type " {
    type = string
    description = "The type of load balancer to create. Possible values are application or network"
  
}

variable "security_groups " {
    type = list(string)
    description = "The security groups to attach to the load balancer. e.g. ['sg-edcd9784','sg-edcd9785']"
  
}

variable "subnet_mapping"{
    type = list(map(string))
    description = "A list of subnet mapping blocks describing subnets to attach to network load balancer"
}

variable "tags"{
    type = map(string)
    description = "A map of tags to add to all resources"
}

variable "target_group_tags" {
    type = map(string)
    description = "A map of tags to add to all target groups"
  
}

variable "target_groups "{
    type = any
    description = "A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend_protocol, backend_port"
}