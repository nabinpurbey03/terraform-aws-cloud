data "aws_region" "current" {}
locals {

}

variable "region" {
  description = "region for aws infrastructure"
  type        = string
}

variable "cidr_block" {
  description = "main ip addresses block for VPC"
  default     = "192.168.0.0/24"
}

variable "vpc_name" {
  description = "Name of VPC"
  default     = "my-tf-vpc"
}

# Just keep cidrs in variables
variable "public_subnets" {
  default = {
    "tf-public-subnet-01" = { cidr = "192.168.0.0/26", az_suffix = "a" },
    "tf-public-subnet-02" = { cidr = "192.168.0.64/26", az_suffix = "b" }
  }
}

variable "private_subnets" {
  default = {
    "tf-private-subnet-01" = { cidr = "192.168.0.128/26", az_suffix = "a" },
    "tf-private-subnet-02" = { cidr = "192.168.0.192/26", az_suffix = "b" }
  }
}

# Locals to merge AZs with region dynamically
locals {
  public_subnets = {
    for name, subnet in var.public_subnets :
    name => {
      cidr = subnet.cidr
      az   = "${data.aws_region.current.region}${subnet.az_suffix}"
    }
  }

  private_subnets = {
    for name, subnet in var.private_subnets :
    name => {
      cidr = subnet.cidr
      az   = "${data.aws_region.current.region}${subnet.az_suffix}"
    }
  }
}
