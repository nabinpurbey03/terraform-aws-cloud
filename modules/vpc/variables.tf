variable "cidr_block" { type = string }
variable "vpc_name" { type = string }

variable "public_subnets" {
  type = map(object({
    cidr = string,
    az_suffix   = string
  }))
}

variable "private_subnets" {
  type = map(object({
    cidr = string,
    az_suffix   = string
  }))
}