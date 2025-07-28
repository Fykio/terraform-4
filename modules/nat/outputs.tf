# Outputs the NAT Gateway IDs
output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs that were created"
    value = aws_nat_gateway.class_4_nat[*].id
}