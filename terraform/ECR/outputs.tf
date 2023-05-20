# Outpus FOR AWS ECR
# Please try to keep this files variables in alphabetical order if possible

output "repository_url" {
  value = aws_ecr_repository.next_js.repository_url
}
