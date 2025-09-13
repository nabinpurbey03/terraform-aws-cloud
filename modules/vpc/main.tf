################################################################################
# Main VPC
################################################################################

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
  }

}


################################################################################
# Public Subnets
################################################################################

resource "aws_subnet" "public_subnet" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az_suffix
  map_public_ip_on_launch = true
  tags                    = { Name = each.key }

}


################################################################################
# Private Subnets
################################################################################

resource "aws_subnet" "private_subnet" {
  for_each = var.private_subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az_suffix
  tags              = { Name = each.key }

}
