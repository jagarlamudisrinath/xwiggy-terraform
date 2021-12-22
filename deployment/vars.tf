variable "environment" {
  default = "xwiggy"
}
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block_1" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr_block_1" {
  default = "10.0.2.0/24"
}
variable "availability_zone_1" {
  default = "us-east-1a"
}

variable "availability_zone_2" {
  default = "us-east-1b"
}
variable "ami_web" {
  default = "ami-00e87074e52e6c9f9"
}
variable "instance_type_web" {
  default = "t2.micro"
}
variable "ami_App" {
  default = "ami-00e87074e52e6c9f9"
}
variable "instance_type_App" {
  default = "t2.micro"
}
variable "private_subnet_cidr_block_2" {
  default = "10.0.4.0/24"
}
variable "public_subnet_cidr_block_2" {
  default = "10.0.3.0/24"
}

variable "AWS_REGION" {
  default = "us-east-1"
}
