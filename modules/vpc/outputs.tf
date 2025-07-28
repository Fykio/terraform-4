# Outputs the VPC ID after creation.
# This allows other modules to reference this VPC.
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.class_4.id
}

# Outputs the VPC CIDR block after successful VPC creation.
output "vpc_cidr" {
  description = "The CIDR block of the created VPC"
  value       = aws_vpc.class_4.cidr_block
}