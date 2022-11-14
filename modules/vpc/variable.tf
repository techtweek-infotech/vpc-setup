variable "vpc_cidr" {
  description = "vpc cidr"
  type        = string
}

variable "availability-zone-list" {
  description = "availabilty zone for subnets"
  type        = string
}

variable "subnet_cidr_block" {
  description = "subnets cidr block"
  type        = string
}

variable "destination_cidr_block" {
  description = "routes cidr block"
  type        = string
}