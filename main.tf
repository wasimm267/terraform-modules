provider "aws" {
     region = "ca-central-1"

}

module "ec2-inst" {
      source = "/home/terraform/day3/demo1/modules/ec2-inst"
      ami_value = "ami-055943271915205db"
      instance_type_value = "t2.micro"
}
