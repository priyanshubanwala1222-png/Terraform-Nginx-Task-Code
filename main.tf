module "vpc_base" {
  source = "./vpc"
  public_1_subnet_id = module.subnet_base.public_1_subnet_id
  vpc-Name = var.vpc-Name
  cidr_block_vari  = var.cidr-block
  instance_tenancy = var.instance_tenancy
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
  public_1_subnet_id = module.subnet_base.public_1_subnet_id
  instance-type = var.instance-type
  key-pair = var.key-pair
}

module "alb_base" {
  source = "./alb"
  vpc-id = module.vpc_base.vpc-id
  alb-sg = module.security_group_base.alb-sg
  Public-subnet-id-1 = module.subnet_base.public_1_subnet_id
  Public-subnet-id-2 = module.subnet_base.public_2_subnet_id
}

module "asg_base" {
  source = "./asg"
  Private-subnet-1-id = module.subnet_base.Private-subnet-1-id
  Private-subnet-2-id = module.subnet_base.Private-subnet-2-id
  private-instance-sg = module.security_group_base.private-instance-sg
  target-group        = module.alb_base.target-group
  key-name            = var.key-pair
}

#module "s3_base" {
 # source = "./s3"
  #s3-bucket-name = var.bucket-name
#}

resource "local_file" "ansible_vars" {
  filename = "${path.module}/bastion_vars.yml"
  content  = <<EOT
bastion_ip: "${module.ec2_base.bastion-ec2-ip}"
EOT
}
