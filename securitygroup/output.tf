output "alb-sg" {
  value = aws_security_group.sg-alb.id
}

output "bastion-sg" {
  value = aws_security_group.bastion_sg.id
}

output "private-instance-sg" {
  value = aws_security_group.private-ec2-sg.id
}