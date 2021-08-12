variable "aws_region" {
  type    = string
  default = "us-west-1"
}

variable "component" {
  type    = string
  default = "expel"
}

variable "enable_assembler" {
  type    = bool
  default = false
}

variable "assember_instance_size" {
  type    = string
  default = "t2.large"
}

variable "assembler_key" {
  type    = string
  default = ""
}

variable "assembler_vpc" {
  type    = string
  default = ""
}

variable "assembler_subnet" {
  type    = string
  default = ""
}
