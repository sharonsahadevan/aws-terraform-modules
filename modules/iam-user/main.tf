module "iam-user" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = var.name
  force_destroy                 = var.force_destroy
  create_iam_user_login_profile = var.create_iam_user_login_profile
}

