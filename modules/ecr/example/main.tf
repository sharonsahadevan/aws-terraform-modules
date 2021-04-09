module "ecr" {
  source               = "./modules/ecr"
  enabled              = var.ecr_enabled
  namespace            = var.ecr_namespace
  stage                = var.ecr_stage
  name                 = var.ecr_name
  environment          = var.environment
  image_tag_mutability = var.ecr_image_tag_mutability
  max_image_count      = var.ecr_max_image_count
  tags = {
    "Organization" = var.organization,
    "Application"  = var.application,
    "Owner"        = var.owner,
    "Stack"        = var.stack,
    "Name"         = "ecr-${var.stack}"

    }
}