output "user_repo_url" {
  value = aws_ecr_repository.user_service.repository_url
}

output "product_repo_url" {
  value = aws_ecr_repository.product_service.repository_url
}

output "order_repo_url" {
  value = aws_ecr_repository.order_service.repository_url
}

