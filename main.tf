resource "aws_vpc" "main" {
  cidr_block = var.cidr
}

module "resource" {
  source = "./modules"
  for_each = var.subnet
  subnet = each.value
  vpc = aws_vpc.main.id
}