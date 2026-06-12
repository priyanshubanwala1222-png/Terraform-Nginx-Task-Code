variable "vpc-id" {
  type = string
}

variable "NAME" {
  default = "SG-as-2"
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