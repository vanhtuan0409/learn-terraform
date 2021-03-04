terraform {
  backend "etcdv3" {
    endpoints = ["127.0.0.1:2379"]
    lock      = true
    prefix    = "terraform/foody-now/prod/"
  }
}

module "based" {
  source = "./based"
}
