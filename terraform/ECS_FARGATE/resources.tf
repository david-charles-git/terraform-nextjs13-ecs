# RESOURCES FOR AWS ECR
# Please try to keep this files variables in alphabetical order if possible

resource "aws_ecs_cluster" "next_js" {
  name = var.aws_ecs_fargate_cluster_name
}
