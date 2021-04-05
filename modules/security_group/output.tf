output "eks_wg_one_sg_id" {
  description = "argus dq dev bastion host ssh security group id"
  value       = module.security_group.this_security_group_id

}

output "eks_wg_two_sg_id_id" {
  description = "argus dq dev mariadb security group id"
  value       = module.security_group.this_security_group_id
}


output "eks_wg_three_sg_id" {
  description = "argus dq dev bastion security group id"
  value       = module.security_group.this_security_group_id
}
