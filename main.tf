# https://support.expel.io/hc/en-us/articles/360061333154-AWS-CloudTrail-getting-started-guide
provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.assembler_vpc]
  }
}

data "aws_subnet" "internal" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "tag:Name"
    values = [var.assembler_subnet]
  }
}
