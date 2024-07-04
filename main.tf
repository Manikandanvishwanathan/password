locals {
  tags = {
       name = "test"
  }
}
provider "aws" {
    region = "us-east-1"
    access_key = "${file("./access-key.txt")}"
    secret_key = "${file("./secret-access-key.txt")}"
}

resource "aws_instance" "TEST" {
    ami = "ami-06c68f701d8090592"
    instance_type = "t2.micro"  
    tags = local.tags
}

output "aws_instance" {
    value = aws_instance.TEST.id
  
}