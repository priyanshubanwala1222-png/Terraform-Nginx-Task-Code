variable "cidr_block_vari" {
    type = string
    default = "10.0.0.0/16" 
}

variable "instance_tenancy" {
    type = string
    default = "default"
}

variable "Name" {
    type = string
    default = "vpc-by-terraform-as-2"
}

variable "Public-subnet-1-id" {
 type = string
}