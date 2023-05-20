# VARIABLES FOR AWS ECR
# Please try to keep this files variables in alphabetical order

variable "aws_ecs_fargate_cluster_name" {
  description = "The AWS ECS FARGATE cluster name"
  type        = string
  default     = "next-js-cluster"
}

variable "aws_ecs_fargate_cluster_region" {
  description = "The AWS ECS FARGATE cluster region"
  type        = string
  default     = "eu-west-1"
}

