# module "iam_devops-group-with-assumable-roles-policy" {
#   source          = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
#   version         = "3.6.0"
#   name            = "devops"
#   group_users     = [module.iam_devops_user1.this_iam_user_name]
#   assumable_roles = [module.iam_devops-assumable-roles.readonly_iam_role_arn]
# }


module "iam-group-with-assumable-roles-policy" {
  source          = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version         = "3.6.0"
  name            = var.name
  group_users     = var.group_users
  assumable_roles = var.assumable_roles
}

