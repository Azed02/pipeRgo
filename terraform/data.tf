data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default" {
  id = element(data.aws_subnet_ids.default.ids, 0)  
}