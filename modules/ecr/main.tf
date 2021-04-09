# IAM Role to be granted ECR permissions
data "aws_iam_role" "ecr" {
  name = "AWSServiceRoleForECRReplication"
}

module "ecr" {
  source                 = "cloudposse/ecr/aws"
  version                = "0.32.0"
  enabled                = var.enabled
  namespace              = var.namespace
  stage                  = var.stage
  name                   = var.name
  principals_full_access = [data.aws_iam_role.ecr.arn]
  environment            = var.environment
  image_tag_mutability   = var.image_tag_mutability
  max_image_count        = var.max_image_count
  tags                   = var.tags
  delimiter              = var.delimiter 

}