output "readonly_iam_role_arn" {
  description = "ARN of readonly IAM role"
  value       = module.iam_assumable_roles.readonly_iam_role_arn
}

output "readonly_iam_role_name" {
  description = "Name of readonly IAM role"
  value       = module.iam_assumable_roles.readonly_iam_role_name
}

output "readonly_iam_role_path" {
  description = "Path of readonly IAM role"
  value       = module.iam_assumable_roles.readonly_iam_role_path
}

output "readonly_iam_role_requires_mfa" {
  description = "Whether readonly IAM role requires MFA"
  value       = module.iam_assumable_roles.readonly_iam_role_requires_mfa
}