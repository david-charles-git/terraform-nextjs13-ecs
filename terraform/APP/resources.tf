# RESOURCES FOR AWS INFRASTRUCTURE
# Please try to keep this files variables in alphabetical order if possible

#aws budget
# resource "aws_budgets_budget" "aws-monthly-budget-title" {
#   name              = "monthly-budget"
#   budget_type       = "COST"
#   limit_amount      = var.aws_budget_monthly_title_limit_USD
#   limit_unit        = "USD"
#   time_unit         = "MONTHLY"
#   #time_period_start = "2020-05-21_00:01"
#   #time_period_end = "2020-05-22_00:01"
# }

#aws elastic IP - NEEDS DEPENDS ON THE ASSOCIATED INTERNET GATEWAY
resource "aws_eip" "aws-eip-title" {
  vpc                       = true
  network_interface         = aws_network_interface.aws-network-interface-title.id
  associate_with_private_ip = "10.0.1.50"

  depends_on = [aws_internet_gateway.aws-internet-gateway-title]
}

#aws instance - EC2
resource "aws_instance" "aws-ec2-instance-title" {
  ami               = var.aws_ec2_instance_title_ami
  instance_type     = var.aws_ec2_instance_title_type
  availability_zone = var.aws_availability_zone_1
  key_name          = var.aws_ec2_instance_key_pair_file_name

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.aws-network-interface-title.id
  }

  user_data = <<-EOF
                sudo apt update -y
                sudo apt upgrade -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                EOF

  tags = {
    Name = "aws-ec2-instace-name"
  }
}

#aws internet gateway
resource "aws_internet_gateway" "aws-internet-gateway-title" {
  vpc_id = aws_vpc.aws-vpc-title.id

  tags = {
    Name = "aws-internet-gateway-name"
  }
}

#aws network interface
resource "aws_network_interface" "aws-network-interface-title" {
  subnet_id       = aws_subnet.aws-subnet-title.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.aws-security-group-allow-all-web-traffic.id]
}

#aws route table
resource "aws_route_table" "aws-route-table-title" {
  vpc_id = aws_vpc.aws-vpc-title.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws-internet-gateway-title.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.aws-internet-gateway-title.id
  }

  tags = {
    Name = "aws_route_table_name"
  }
}

#aws route table association
resource "aws_route_table_association" "aws-route-table-assciation-title" {
  subnet_id      = aws_subnet.aws-subnet-title.id
  route_table_id = aws_route_table.aws-route-table-title.id
}

#aws security group
resource "aws_security_group" "aws-security-group-allow-all-web-traffic" {
  name        = "allow_all_web_traffic"
  description = "Allow all inbound web traffic"
  vpc_id      = aws_vpc.aws-vpc-title.id

  ingress = [
    {
      description      = "HTTPS from vpc"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "HTTP from vpc"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "SSH from vpc"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [{
    description      = "all all traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]

  tags = {
    Name = "allow-all-web-traffc"
  }
}

#aws subnet
resource "aws_subnet" "aws-subnet-title" {
  vpc_id            = aws_vpc.aws-vpc-title.id
  cidr_block        = var.aws_subnet_cidr_title
  availability_zone = var.aws_availability_zone_1

  tags = {
    Name = "aws-subnet-name"
  }
}

#aws VPC
resource "aws_vpc" "aws-vpc-title" {
  cidr_block = var.aws_vpc_cidr_title

  tags = {
    Name = "aws-vpc-name"
  }
}
