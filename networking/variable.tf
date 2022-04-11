# TAGS

variable "tags" {
  description = "Created by and Created via tags"
  type        = map(string)

#   default = {
#     created_by  = "blessenpeter"
#     created_via = "terraform"
#   }
}

# CIDR BLOCKS

variable "cidr_vpc" {
  description = "CIDR Block for VPC"
  type        = string

#   default = "10.0.0.0/16"
}

variable "cidr_prv1" {
  description = "CIDR Block for Private Subnet 1"
  type        = string

#   default = "10.0.0.0/24"
}

variable "cidr_prv2" {
  description = "CIDR Block for Private Subnet 2"
  type        = string

#   default = "10.1.0.0/24"
}

variable "cidr_pub1" {
  description = "CIDR Block for Public Subnet 1"
  type        = string

#   default = "10.2.0.0/24"
}

variable "cidr_pub2" {
  description = "CIDR Block for PriPublic Subnet 2"
  type        = string

#   default = "10.3.0.0/24"
}


# PROJECT NAME
variable "project_name" {
  description = "Project Name"
  type        = string
#   default     = "gtech"
}

# PROJECT & ENVIORNMENT
variable "environment" {
  description = "Project Environment"
  type        = string
#   default     = "dev"
}

