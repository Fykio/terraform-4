# Outputs the IDs of all created Public Subnets
# `value` uses `splat expression` to get all IDs
output "public_subnet_ids" {
    description = "List of IDs of the created Public Subnets"
    value       = aws_subnet.public[*].id
}

# Outputs the IDs of all created Private Subnets, useful by NAT Gateways
output "private_subnet_ids" {
    description = "List of IDs of the created Private Subnets"
    value       = aws_subnet.private[*].id
}