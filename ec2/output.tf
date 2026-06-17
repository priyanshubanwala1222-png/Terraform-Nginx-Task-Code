output "bastion-ec2-id" {
  value = aws_instance.Bastion_instance.id
}

output "bastion-ec2-ip" {
  value = aws_instance.Bastion_instance.public_ip 
}