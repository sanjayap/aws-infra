variable "env" {
  type    = string
  default = "dev"
}

variable "vpc_cidr" {
  type    = string
  default = "10.1.0.0/16"
}

variable "public_subnets" {
  type = map(any)
  default = {
    ap-southeast-2a = "10.1.0.0/24",
    ap-southeast-2b = "10.1.128.0/24"
  }
}

variable "private_app_subnets" {
  type = map(any)
  default = {
    ap-southeast-2a = "10.1.32.0/24",
    ap-southeast-2b = "10.1.160.0/24"
  }
}

variable "private_db_subnets" {
  type = map(any)
  default = {
    ap-southeast-2a = "10.1.64.0/24",
    ap-southeast-2b = "10.1.192.0/24"
  }
}
