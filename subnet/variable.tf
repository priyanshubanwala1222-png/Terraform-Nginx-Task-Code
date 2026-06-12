variable "vpc-id" {
  type = string
}

variable "CIDR-block-Public-1" {
  default = "10.0.1.0/24"
}

variable "east-1a-az" {
  default = "us-east-1a"
}

variable "east-1b-az" {
  default = "us-east-1b"
}

variable "CIDR-block-Public-2" {
  default = "10.0.2.0/24"
}

variable "CIDR-block-Private-3" {
  default = "10.0.3.0/24"
}

variable "CIDR-block-Private-4" {
  default = "10.0.4.0/24"
}

variable "map_public_ip_on_launch" {
  default = true
}

variable "igw-id" {
  type = string
}

variable "nat-gateway-id" {
  type = string
}

variable "NAME" {
  default = "5-9-2026"
}