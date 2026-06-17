resource "aws_instance" "Bastion_instance" {
  ami                         = var.ami-us-east-1-ubuntu-24
  instance_type               = var.instance-type
  subnet_id                   = var.public_1_subnet_id
  vpc_security_group_ids      = [var.bastion-sg]
  key_name                    = var.key-pair
  associate_public_ip_address = true

  tags = {
    Name        = "bastion-host-nginx"
    Environment = "dev"
  }
}