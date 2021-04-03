variable "name" {}
variable "description" {}
variable "vpc_id" {}
variable "ingress_with_cidr_blocks" {
  type    = list(map(string))
  default = []
}
variable "egress_cidr_blocks" {}
variable "egress_rules" {}
variable "ingress_with_source_security_group_id" {
  type    = list(map(string))
  default = []

}

variable "ingress_with_self" {
  type    = list(map(string))
  default = []

}





