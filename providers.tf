variable "aws_creds" {
  description = "AWS Credentials"
  type = object({
    region     = string
    access_key = string
    secret_key = string
  })
}

provider "aws" {
  region     = var.aws_creds.region
  access_key = var.aws_creds.access_key
  secret_key = var.aws_creds.secret_key
}
