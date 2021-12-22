variable "public_lb_name" {
  type = string
}

variable "subnet" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}
variable "tag" {
  type = string
}

variable "bucket_name" {
  type = string
}
