
# Modules In Terraform
Let us assume that we are using terrafrom to create a lot of resorces to create our own infrastructure like EC2, LAMBDA, S3, VPC etc.
it'll be difficult for a devops engineer to create and diffrentiate between multiple resorces as there might be thousands of script written.
instead its important to create a separate resource book called modules which we can use.

# Demo For Creating An EC2 Instance In AWS
1. Create A Main.tf file


provider "aws" {
        region = "ca-central-1"
       }


resource "aws_instance" "demo-inst" {
      ami = var.ami_value
      instance_type = var.instance_type_value


}

2. Create variables.tf file

variable "ami_value" {
       description = " value for the ami "

}

variable "instance_type_value" {
       description = " value for instance type "


}

3. Create Output.tf to get the public ip of created instance





output "publiv_ip_address" {
            
            value = aws_instance.demo-inst.public_ip # resourcetype.resourcename.what_to_print

}
# ** move all the created file in a location 
in my case i have moved all the files in 
/home/terraform/day3/demo1/modules/ec2-inst
you can also upload it to github so that your other team mates can use it 

# create another folder for your reference ( ex - ec2)

1. Create main.tf file 




    provider "aws" {
     region = "ca-central-1"

      
      }


    module "ec2-inst" {
    
      
       source = "/home/terraform/day3/demo1/modules/ec2-inst"
       ami_value = "ami-055943271915205db"
       instance_type_value = "t2.micro"
}


# above code will be available in my github repo within the same directory so use this as a reference


Go to the folder where you have created the main.tf file and execute these commands 

1. terraform init
2. terraform plan
3. terraform apply
4. terraform destroy 


# make sure you have configured AWS cli 



