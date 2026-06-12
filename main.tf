module "vpc_base" {
  source = "./vpc"
  Public-subnet-1-id = module.subnet_base.Public-subnet-1-id
}

module "subnet_base" {
  source = "./subnet"
  vpc-id = module.vpc_base.vpc-id
  igw-id = module.vpc_base.igw-id
  nat-gateway-id = module.vpc_base.nat-gateway-id
}

module "security_group_base" {
  source = "./securitygroup"
  vpc-id = module.vpc_base.vpc-id
}

module "ec2_base" {
  source = "./ec2"
  bastion-sg = module.security_group_base.bastion-sg
  Public-subnet-1-id = module.subnet_base.Public-subnet-1-id
  instance-type = var.instance-type
  key-pair = var.key-pair
}

module "alb_base" {
  source = "./alb"
  vpc-id = module.vpc_base.vpc-id
  alb-sg = module.security_group_base.alb-sg
  Public-subnet-1-id = module.subnet_base.Public-subnet-1-id
  Public-subnet-2-id = module.subnet_base.Public-subnet-2-id
}

module "asg_base" {
  source = "./asg"
  Private-subnet-1-id = module.subnet_base.Private-subnet-1-id
  Private-subnet-2-id = module.subnet_base.Private-subnet-2-id
  private-instance-sg = module.security_group_base.private-instance-sg
  target-group = module.alb_base.target-group
}

module "s3_base" {
  source = "./s3"
  s3-bucket-name = var.bucket-name
}