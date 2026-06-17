variable "vpc-id" {
  type = string
}

variable "public_subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
  default = {
    "public-1" = {
      cidr_block        = "10.0.1.0/24" 
      availability_zone = "us-east-1a"
    }
    "public-2" = {
      cidr_block        = "10.0.2.0/24" 
      availability_zone = "us-east-1b" 
    }
  }
}

variable "private_subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
  default = {
    "private-1" = {
      cidr_block        = "10.0.3.0/24" 
      availability_zone = "us-east-1a"
    }
    "private-2" = {
      cidr_block        = "10.0.4.0/24" 
      availability_zone = "us-east-1b" 
    }
  }
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
  default = "Nginx-Subnet"
}