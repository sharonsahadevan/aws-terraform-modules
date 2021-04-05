# module "iam_devops-assumable-roles" {
#   source                     = "terraform-aws-modules/iam/aws//modules/iam-assumable-roles"
#   version                    = "3.6.0"
#   readonly_role_name         = "eks_devops"
#   create_readonly_role       = true
#   force_detach_policies      = true
#   readonly_role_policy_arns  = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
#   trusted_role_arns          = ["arn:aws:iam::${var.account_id}:root"]
#   readonly_role_requires_mfa = false

# }


module "iam_assumable_roles" {
  source                     = "terraform-aws-modules/iam/aws//modules/iam-assumable-roles"
  version                    = "3.6.0"
  readonly_role_name         = var.readonly_role_name
  create_readonly_role       = var.create_readonly_role
  force_detach_policies      = var.force_detach_policies
  readonly_role_requires_mfa = var.readonly_role_requires_mfa
  readonly_role_policy_arns  = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  trusted_role_arns          = ["arn:aws:iam::${var.account_id}:root"]

}