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
  value = module.subnet_base.Public-subnet-1-id
}

output "Pubic-subnet-2-id" {
  value = module.subnet_base.Public-subnet-2-id
}

output "Private-instance-1-id" {
  value = module.subnet_base.Private-subnet-1-id
}

output "Private-instance-2-id" {
  value = module.subnet_base.Public-subnet-2-id
}

output "RT-Pubic" {
  value = module.subnet_base.Route-table-public-id
}

output "RT-Private" {
  value = module.subnet_base.Route-table-private-id
}

output "ec2-id" {
  value = module.ec2_base.ec2-id
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

# output "vpc_id" {
#   description = "VPC ID"
#   value       = aws_vpc.VPC_Structure.id
# }

# output "public_subnet_01_id" {
#   value       = aws_subnet.Private-subnet-1.id
# }

# output "public_subnet_02_id" {
#   value       = aws_subnet.Public-subnet-2.id
# }

# output "private_subnet_01_id" {
#   value       = aws_subnet.Private-subnet-1.id
# }

# output "private_subnet_02_id" {
#   value       = aws_subnet.Private-subnet-2.id
# }

# output "nat_gateway_public_ip" {
#   value       = aws_nat_gateway.nat-as-1.public_ip
# }


# output "alb_arn" {
#   value       = aws_lb.as-1-alb.arn
# }

# output "alb_dns_name" {
#   value       = aws_lb.as-1-alb.dns_name
# }

# output "target_group_arn" {
#   description = "NGINX Target Group ARN"
#   value       = aws_lb_target_group.lb-target-v2.id
# }

# output "asg_name" {
#   description = "Auto Scaling Group name"
#   value       = aws_autoscaling_group.asg-as-1.name
# }

# output "launch_template_id" {
#   description = "Launch Template ID"
#   value       = aws_launch_template.lt-as-1.id
# }

# output "bastion_public_ip" {
#   description = "Bastion Host public IP — use for SSH jump"
#   value       = aws_instance.Bastion_instance.public_ip
# }

# output "tf_state_bucket_name" {
#   description = "S3 bucket storing Terraform state"
#   value       = aws_s3_bucket.s3_bucket.bucket
# }