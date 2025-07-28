# The VPC ID where subnets will be created
variable "vpc_id" {
    description = "The ID of the VPC where subnets should be created"
    type        = string  
}

# This list should be within the VPC CIDR block
variable "public_subnet_cidrs" {
    description = "List of CIDR blocks for the Public Subnets"
    type        = list(string)
}

# This list should be within the VPC CIDR block
variable "private_subnet_cidrs" {
    description = "List of CIDR blocks for the Private Subnets"
    type        = list(string)
}

# This list should match the `count` of CIDR blocks
variable "azs" {
    description = "List of Availability Zones to distribute Subnets across"
    type        = list(string)
}

variable "env" {
    description = "Environment name for resource categorization"
    type        = string
}
