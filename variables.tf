data "aws_region" "current" {}

# Fetch available AZs in the current region
data "aws_availability_zones" "available" {
  state = "available"
}

# Example: pick the first 2 AZs dynamically
locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 2)
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
    "tf-public-subnet-01" = { cidr = "192.168.0.0/26", az = "ap-south-1a" },
    "tf-public-subnet-02" = { cidr = "192.168.0.64/26", az = "ap-south-1b" }
  }
}

variable "private_subnets" {
  default = {
    "tf-private-subnet-01" = { cidr = "192.168.0.128/26", az = "ap-south-1a" },
    "tf-private-subnet-02" = { cidr = "192.168.0.192/26", az = "ap-south-1b" }
  }
}
