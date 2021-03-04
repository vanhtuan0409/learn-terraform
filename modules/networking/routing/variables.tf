variable "name" {
  description = "Route table name"
  type        = string
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet ids this routing should be attached to"
  type        = list(string)
}

variable "routes" {
  description = "Routes associate to this route table"
  type        = list(any)
  default     = []
}
