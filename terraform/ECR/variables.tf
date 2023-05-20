# VARIABLES FOR AWS ECR
# Please try to keep this files variables in alphabetical order

variable "aws_ecr_nextjs_name" {
  description = "The AWS ECR name for the next-js repository"
  type        = string
  default     = "next-js"
}

variable "aws_ecr_nextjs_region" {
  description = "The AWS ECR region for the next-js repository"
  type        = string
  default     = "eu-west-1"
}

