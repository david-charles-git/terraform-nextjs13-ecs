# RESOURCES FOR AWS ECR
# Please try to keep this files variables in alphabetical order if possible

resource "aws_ecr_repository" "next_js" {
  name = var.aws_ecr_nextjs_name
}
