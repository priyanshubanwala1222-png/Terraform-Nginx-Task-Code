variable "ami-us-east-1-ubuntu-24" {
  default = "ami-0c7217cdde317cfec"
}

variable "instance-type" {
  default = "t3.micro"
}

variable "Public-subnet-1-id" {
  type = string
}

variable "bastion-sg" {
  type = string
}

variable "key-pair" {
  default = "ansible-green"
}