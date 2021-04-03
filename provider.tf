# # provider "aws" {
# #   profile = var.profile
# #   region  = var.region

# # }

# # #Set S3 backend for persisting TF state file remotely, ensure bucket already exits
# # # And that AWS user being used by TF has read/write perms
# # terraform {
# #   required_version = ">=0.14.0"
# #   required_providers {
# #     aws = "~> 3.0"
# #   }
# # #   backend "s3" {
# # #     region  = "eu-central-1"
# # #     profile = "dt"
# # #     key     = "terraformstatefile"
# # #     bucket  = "dil-dev-terraform-state"
# # #   }
# # }


# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "3.34.0"
#     }
#   }
# }

# provider "aws" {
#   profile = var.profile
#   region  = var.region
# }