output "vpc-id" {
  value = module.vpc_base.vpc-id
}

output "nat-gt-id" {
  value = module.vpc_base.nat-gateway-id
}

output "igw-id" {
  value = module.vpc_base.igw-id
}

output "elastic-ip" {
  value = module.vpc_base.elastic-ip-id
}

output "Pubic-subnet-id" {
  value = module.subnet_base.public_1_subnet_id
}

output "Pubic-subnet-2-id" {
  value = module.subnet_base.public_2_subnet_id
}

output "Private-subnet-1-id" {
  value = module.subnet_base.Private-subnet-1-id
}

output "Private-subnet-2-id" {
  value = module.subnet_base.Private-subnet-2-id
}

output "RT-Pubic" {
  value = module.subnet_base.Route-table-public-id
}

output "RT-Private" {
  value = module.subnet_base.Route-table-private-id
}

output "bastion-public-ip" {
  value = module.ec2_base.bastion-ec2-ip
}

output "secutiy-gp-alb" {
  value = module.security_group_base.alb-sg
}

output "sg-bastion" {
  value = module.security_group_base.bastion-sg
}

output "private-sg" {
  value = module.security_group_base.private-instance-sg
}

output "alb" {
  value = module.alb_base.Load-balancer
}

output "alb-tg" {
  value = module.alb_base.target-group
}

output "asg" {
  value = module.asg_base.auto-scalling
}

output "s3-bucket-id" {
  value = module.s3_base.s3-bucket
}

output "s3-arn" {
  value = module.s3_base.s3-arn
}

output "DB" {
  value = module.s3_base.DB
}
