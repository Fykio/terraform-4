# The VPC ID where resources should be created
variable "vpc_id" {
    description = "The ID of the VPC where NAT Gateway should be created"
    type        = string
}

# List of Public Subnet IDs where NAT Gateways should be placed
variable "public_subnet_ids" {
  description = "List of public subnet IDs where NAT Gateways should be deployed"
  type        = list(string)
}

# List of private subnet IDs that need internet access via NAT Gateway
variable "private_subnet_ids" {
  description = "List of private subnet IDs that need NAT Gateway"
  type        = list(string)
}

variable "env" {
  description = "Environment name for resource categorization"
  type        = string
}