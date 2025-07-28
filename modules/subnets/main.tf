# Creates Public Subnets, attached to the VPC, one per public CIDR,
# and distributed across the specified Availability Zones
# Resource deployed within will have direct access to the Internet
resource "aws_subnet" "public" {
    count                   = length(var.public_subnet_cidrs)
    vpc_id                  = var.vpc_id
    cidr_block              = var.public_subnet_cidrs[count.index]
    availability_zone       = var.azs[count.index]

    # Automatically assigns public IPs to instances deployed here
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.env}-public-${count.index}"
    }
}

# Creates Private Subnets, attached to the VPC, one per private CIDR,
# and distributed across the specified Availability Zones
# Resource deployed within will not have direct access to the Internet
resource "aws_subnet" "private" {
    count             = length(var.private_subnet_cidrs)
    vpc_id            = var.vpc_id
    cidr_block        = var.private_subnet_cidrs[count.index]
    availability_zone = var.azs[count.index]

    tags = {
        Name = "${var.env}-private-${count.index}"
    }
}
