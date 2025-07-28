variable "vpc_id" {
    description = "The VPC ID where the Internet Gateway should be attached"
    type        = string
}

variable "env" {
    description = "Environment name for resource categorization"
    type = string
}
