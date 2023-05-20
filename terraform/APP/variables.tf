# VARIABLES FOR AWS INFRASTRUCTURE
# Please try to keep this files variables in alphabetical order

variable "aws_availability_zone_1" {
  description = "AWS availability zone"
  type        = string
  default     = "eu-west-1a"
}

variable "aws_budget_monthly_title_limit_USD" {
  description = "AWS account monthly budget limit (USD)"
  type        = string
  default     = "20.0"
}

variable "aws_ec2_instance_key_pair_file_name" {
  description = "AWS subnet cidr block"
  type        = string
  default     = "ec2-keypair"
}

variable "aws_ec2_instance_title_ami" {
  description = "AWS EC2 instance ami ID"
  type        = string
  default     = "ami-01dd271720c1ba44f" #Ubuntu, 22.04 LTS, amd64
}

variable "aws_ec2_instance_title_type" {
  description = "AWS EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "aws_provider_access_key" {
  description = "AWS user access key for all resources"
  type        = string
  default     = "xxxxxxxxx"
}

variable "aws_provider_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "eu-west-1"
}

variable "aws_provider_secret_key" {
  description = "AWS user secret key for all resources"
  type        = string
  default     = "xxxxxxxxx"
}

variable "aws_subnet_cidr_title" {
  description = "AWS subnet cidr block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "aws_vpc_cidr_title" {
  description = "AWS VPC cidr block"
  type        = string
  default     = "10.0.0.0/16"
}


