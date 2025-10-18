variable "vpc_config" {
  description = "To get the CIDR and name of VPC from user"
  type = object({
    cidr_block = string
    name = string
  })
  default = {
    cidr_block = "10.0.0.0/16"
    name = "my-vpc"
  }

  validation {
    condition = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR Format- ${var.vpc_config.cidr_block}"
}
}

variable "subnet_config" {
    description = "Get the CIDR and AZ for the subnets"
    type = map(object({
      cidr_block = string
      az = string

      public = optional(bool,false)
    }))
    
    default = {
    subnet1 = {
      cidr_block = "10.0.1.0/24"
      az         = "ap-south-1a"
      public     = true
    }
    subnet2 = {
      cidr_block = "10.0.2.0/24"
      az         = "ap-south-1b"
      public     = false
    }
  }

    validation {
    condition = alltrue([for config in var.subnet_config: can(cidrnetmask(config.cidr_block))])
    error_message = "Invalid CIDR Format- ${var.vpc_config.cidr_block}"
}
  
}