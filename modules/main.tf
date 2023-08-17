resource "aws_subnet" "main" {
  vpc_id     = var.vpc
  cidr_block =var.subnets["cidr"]
  availability_zone =var.subnets["az"]
}

variable "vpc" {}
variable "subnets" {}