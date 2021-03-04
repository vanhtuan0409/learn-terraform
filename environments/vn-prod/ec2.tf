resource "aws_key_pair" "provision_key" {
  key_name   = "tuan-rsa"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "invoker" {
  ami           = "ami-09a6a7e49bd29554b"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.provision_key.key_name

  subnet_id = module.based.proxy_subnets[0].id
  vpc_security_group_ids = [
    module.based.sg_base.id
  ]

  tags = {
    Name = "MyYoloInstance-1"
  }
}

resource "aws_instance" "puck" {
  ami           = "ami-09a6a7e49bd29554b"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.provision_key.key_name

  subnet_id = module.based.app_subnets[0].id
  vpc_security_group_ids = [
    module.based.sg_base.id
  ]

  tags = {
    Name = "MyYoloInstance-1"
  }
}
