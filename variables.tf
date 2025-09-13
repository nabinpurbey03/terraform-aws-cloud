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

variable "ig_name" {
  description = "Internet Gateway for the VPC"
  default     = "tf-main-igw"
}
