provider "aws" {
        region = "ca-central-1"
       }


resource "aws_instance" "demo-inst" {
      ami = var.ami_value
      instance_type = var.instance_type_value
      

}
