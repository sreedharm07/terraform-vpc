resource "aws_subnet" "main" {
  for_each = var.subnet
  vpc_id     = var.vpc
  cidr_block = each.value["cidr"]
  availability_zone =each.value["az"]
}

variable "vpc" {}
variable "subnet" {}