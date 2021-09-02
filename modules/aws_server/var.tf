variable "ami" {
  description = "Instance AMI ID"
  type        = string
  default     = "ami-0b3d7a5ecc2daba4c"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "name" {
  type    = string
  default = "app"
}

variable "instance_size" {
  description = "Instance Size"
  type        = string
  default     = "t3a.micro"
}

variable "subnet_id" {
  type = string
}

variable "root_disksize" {
  description = "root Disk Size"
  type        = string
  default     = "20"
}
