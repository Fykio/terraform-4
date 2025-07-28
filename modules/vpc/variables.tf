# defines the CIDR block for the VPC - IP address range for the entire network
variable "vpc_cidr" {
  description = "CIDR block for class 4 vpc"
  type        = string
}

# Environment name variable used for tagging resources
variable "env" {
  description = "Environment name for resource categorization"
  type        = string
}