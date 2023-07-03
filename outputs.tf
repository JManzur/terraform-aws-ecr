output "repository_url" {
  description = "The URL of the ECR Repository"
  value       = { for url, repo in aws_ecr_repository.this : url => repo.repository_url }

  # Usage: module.<module_name>.repository_url["<repository_name>"]
  # Example: module.ecr.repository_url["app"]
}

output "repository_arn" {
  description = "The ARN of the ECR Repository"
  value       = { for arn, repo in aws_ecr_repository.this : arn => repo.arn }

  # Usage: module.<module_name>.repository_arn["<repository_name>"]
  # Example: module.ecr.repository_arn["app"]
}