# Outputs FOR AWS ECR
# Please try to keep this files variables in alphabetical order if possible

output "aws_ec2_instance_title_public_ip" {
  value = aws_eip.aws-eip-title.public_ip
}
