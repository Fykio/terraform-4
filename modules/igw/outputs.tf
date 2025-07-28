# Outputs the Internet Gateway ID
output "igw_id" {
    description = "The ID of the created Internet Gateway"
    value       = aws_internet_gateway.class_4_igw.id
}

# Outputs the public route table ID
output "public_route_table_id" {
    description = "The ID of the Public Route Table (for subnet associations)"
    value       = aws_route_table.public_rt.id
}