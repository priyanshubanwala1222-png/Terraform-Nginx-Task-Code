variable "ami" {
  default = "ami-05cf1e9f73fbad2e2"
}

variable "instance-type" {
  default = "t3.small"
}

variable "NAME" {
  default = "Private"
}

variable "key-name" {
  default = "ansible-green"
}

variable "private-instance-sg" {
  type = string
}

variable "Private-subnet-1-id" {
  type = string
}

variable "Private-subnet-2-id" {
  type = string
}

variable "target-group" {
  type = string
}