variable "vpc_id" {
  description = "VPC id this subnet should be created in"
  type        = string
}

variable "subnet_cidrs" {
  description = "List of subnets CIDR"
  type        = list(string)
}

variable "name_prefix" {
  description = "Prefix of tag Name"
  type        = string
  default     = ""
}

variable "public_ip" {
  description = "Should enable public ip"
  type        = bool
  default     = null
}

variable "ipv6" {
  description = "Should enable ipv6"
  type        = bool
  default     = null
}

variable "tags" {
  description = "Tags"
  type        = any
  default     = {}
}
