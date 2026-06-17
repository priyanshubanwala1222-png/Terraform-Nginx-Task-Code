variable "vpc-name" {
  default = "as-2"
}

variable "vpc-Name" {
  default = "Nginx-infra"
}

variable "cidr-block" {
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
    type = string
    default = "default"
}

variable "instance-type" {
  default = "t3.micro"
}

variable "key-pair" {
  default = "ansible-green"
}

variable "Name" {
    type = string
    default = "vpc-by-terraform-as-2"
}

variable "bucket-name" {
  default = "as-1-dev-bucket-priyanshu-2026069"
}