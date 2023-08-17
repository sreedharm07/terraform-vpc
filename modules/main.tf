resource "aws_subnet" "main" {

  for_each = var.subnets

  vpc_id     = var.vpc
  cidr_block =each.value["cidr"]
  availability_zone =each.value["az"]

  tags = {
    Name = each.key
  }
}


resource "aws_route_table" "main" {
  vpc_id = var.vpc

  for_each = var.subnets

  tags = {
    Name = each.key
  }
}


resource "aws_route_table_association" "aws" {
  for_each = var.subnets
  subnet_id      = lookup(lookup(aws_subnet.main,each.key, null),"id",null)
  route_table_id = aws_route_table.main[each.key].id #bothe do same work
}

variable "vpc" {}
variable "subnets" {}

