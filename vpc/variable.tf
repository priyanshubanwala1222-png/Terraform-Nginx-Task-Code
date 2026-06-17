variable "cidr_block_vari" {
    type = string
    default = "10.0.0.0/16" 
}

variable "instance_tenancy" {
    type = string
    default = "default"
}

variable "vpc-Name" {
    type = string
    default = "vpc-by-terraform-nginx"
}

variable "public_1_subnet_id" {
 type = string
}