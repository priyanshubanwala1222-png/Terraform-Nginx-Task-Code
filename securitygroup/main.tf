resource "aws_security_group" "sg-alb" {
  name        = "${var.NAME}-alb-sg-nginx"
  description = "Allow HTTP and HTTPS inbound from the internet"
  vpc_id      = var.vpc-id

  ingress {
    description = "HTTPS from internet"
    from_port   = var.from-port-alb-sg-80
    to_port     = var.from-port-alb-sg-80
    protocol    = var.protocol-tcp
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    description = "HTTPS from internet"
    from_port   = var.from-port-alb-sg-443
    to_port     = var.from-port-alb-sg-443
    protocol    = var.protocol-tcp
    cidr_blocks = var.CIDR-0-0
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

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg-${var.NAME}"
  description = "Allow SSH inbound to Bastion host"
  vpc_id      = var.vpc-id

  ingress {
    description = "SSH from allowed CIDR"
    from_port   = var.from-port-alb-sg-22
    to_port     = var.from-port-alb-sg-22
    protocol    = var.protocol-tcp
    cidr_blocks = var.CIDR-0-0
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

  ingress {
    description = "SSH from Bastion"
    from_port   = var.from-port-alb-sg-22
    to_port     = var.from-port-alb-sg-22
    protocol    = var.protocol-tcp
    security_groups = [aws_security_group.bastion_sg.id]
  }

  ingress {
    description = "POR80"
    from_port   = var.from-port-alb-sg-80
    to_port     = var.from-port-alb-sg-80
    protocol    = var.protocol-tcp
    security_groups = [aws_security_group.sg-alb.id]
  }
  

  egress {
    description = "All outbound SSH"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.CIDR-0-0
  }

  tags = {
    Name = "${var.NAME}--infra-ec2-sg"
  }
}