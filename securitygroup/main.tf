resource "aws_security_group" "sg-alb" {
  name        = "${var.NAME}-alb-sg"
  description = "Allow HTTP and HTTPS inbound from the internet"
  vpc_id      = var.vpc-id

  dynamic "ingress" {
    for_each = var.alb_ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = var.protocol-tcp
      cidr_blocks = ingress.value.cidr_block
    }
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.CIDR-0-0
  }

  tags = {
    Name = "${var.NAME}-alb-sg-nginx"
  }
}

data "http" "my_public_ip" {
  url = "https://ifconfig.me/ip"
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg-${var.NAME}"
  description = "Allow SSH inbound to Bastion host"
  vpc_id      = var.vpc-id

  ingress {
    description = "SSH from allowed CIDR"
    from_port   = var.from-port-alb-sg-22
    to_port     = var.from-port-alb-sg-22
    protocol    = var.protocol-tcp
    cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.CIDR-0-0
  }

  tags = {
    Name = "${var.NAME}-nginx-as-1-bastion-sg"
  }
}

resource "aws_security_group" "private-ec2-sg" {
  name        = "nginx-infra-alb-ec2"
  description = "Allow HTTP from ALB only; all outbound"
  vpc_id      = var.vpc-id

  dynamic "ingress" {
    for_each = [
      {
        description     = "SSH from Bastion"
        port            = var.from-port-alb-sg-22
        security_groups = [aws_security_group.bastion_sg.id]
      },
      {
        description     = "PORT-80"
        port            = var.from-port-alb-sg-80
        security_groups = [aws_security_group.sg-alb.id]
      }
    ]

    content {
      description     = ingress.value.description
      from_port       = ingress.value.port
      to_port         = ingress.value.port
      protocol        = var.protocol-tcp
      security_groups = ingress.value.security_groups
    }
  }

  egress {
    description = "All outbound SSH"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.CIDR-0-0
  }

  tags = {
    Name = "${var.NAME}-infra-asg-sg"
  }
}