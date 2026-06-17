variable "vpc-id" {
  type = string
}

variable "NAME" {
  default = "Nginx"
}

variable "alb_ingress_rules" {
  type=map(object({
    description = string
    port        = number
    cidr_block  = list(string)
  }))
  default = {
    "http" = {
      description = "HTTP from internet"
      port        = 80
      cidr_block  = ["0.0.0.0/0"]
    }

    "https" = {
      description = "HTTPS from internet"
      port        = 443
      cidr_block  = ["0.0.0.0/0"]
    }
  }
}

variable "from-port-alb-sg-80" {
  default = "80"
}

variable "from-port-alb-sg-443" {
  default = "443"
}

variable "from-port-alb-sg-22" {
  default = "22"
}

variable "protocol-tcp" {
  default = "tcp"
}

variable "CIDR-0-0" {
  default = ["0.0.0.0/0"]
}