resource "aws_vpc" "main" {
  cidr_block = var.cidr
}

module "component" {
  source = "./modules"

  for_each = var.subnets
  vpc=aws_vpc.main.id
  subnets=each.value
}
