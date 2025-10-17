# Terraform-aws-vpc

This Terraform module creates an AWS VPC with a given CIDR block. It also creates multiple subnets ( public and private ), and for public subnets, it sets up an Internet gateway (IGW) and appropriate route tables.

# Example

provider "aws" {
    region = "ap-south-1"
  
}

module "vpc" {
    source = "./module/vpc"

    vpc_config = {
      cidr_block = "10.0.0.0/16"
      name = "my-tset-vpc"
    }

    subnet_config ={
        public_subnet ={
            cidr_block = "10.0.0.0/24"
            az = "ap-south-1a"
            public = true
        }
        
        private_subnet ={
            cidr_block = "10.0.1.0/24"
            az = "ap-south-1b"
        }
    
}
  
}

