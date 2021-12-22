variable "db_security_group" {
  type = string
}

variable "db_user_name" {
  type = string
}

variable "db_password" {
  type = string
}
variable "subnets" {
  type = list(string)
}

variable "rds_name" {
  type = string
}
