module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr               = "" #cidr block for vpc "10.0.0.0/16"
  availability-zone-list = ["", ""] #availability zone ["us-east-1a", "us-east-1b"]
  subnet_cidr_block      = ["", ""] #cidr block for subnets ["10.0.10.0/24", "10.0.20.0/24"]
  destination_cidr_block = "" #cidr block for routes "0.0.0.0/0"
}
