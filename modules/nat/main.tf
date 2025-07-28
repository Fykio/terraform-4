# creates Elastic IPs for NAT Gateways as required for outbound Internet access
resource "aws_eip" "nat_eip" {
    count = length(var.public_subnet_ids)

    tags = {
        Name = "${var.env}-nat-eip-${count.index}"
    }
}

# creates NAT Gateways in Public Subnets to allow resources in Private Subnets access the Internet
resource "aws_nat_gateway" "class_4_nat" {
    count         = length(var.public_subnet_ids)
    allocation_id = aws_eip.nat_eip[count.index].id
    subnet_id     = var.public_subnet_ids[count.index]

    tags = {
        Name = "${var.env}-nat-gw-${count.index}"
    }
}

# creates route tables for Private Subnets
resource "aws_route_table" "private_rt" {
    count   =  length(var.private_subnet_ids)
    vpc_id  = var.vpc_id

    tags = {
        Name = "${var.env}-private-rt-${count.index}"
    }
}

# adds routes to NAT Gateways in private route tables
resource "aws_route" "private_nat_gateway" {
    count                   = length(var.private_subnet_ids)
    route_table_id          = aws_route_table.private_rt[count.index].id
    destination_cidr_block  = "0.0.0.0/0"
    nat_gateway_id          = aws_nat_gateway.class_4_nat[count.index].id
}

# associates private subnets with their route tables
resource "aws_route_table_association" "private_rt_assoc" {
    count           =  length(var.private_subnet_ids)
    subnet_id       = var.private_subnet_ids[count.index]
    route_table_id  = aws_route_table.private_rt[count.index].id
}