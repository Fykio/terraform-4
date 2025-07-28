# creates an Internet Gateway for the VPC for use by resources
# in the Public Subnets to access the Internet
resource "aws_internet_gateway" "class_4_igw" {
    vpc_id = var.vpc_id

    tags = {
      Name = "${var.env}-igw"
    }
}

# creates a Route Table for Public Subnets within the VPC
resource "aws_route_table" "public_rt" {
    vpc_id = var.vpc_id

    tags = {
      Name = "${var.env}-public-rt"
    }
}

# Adds a default route to the internet on the Internet Gateway
resource "aws_route" "public_igw_route" {
    route_table_id          = aws_route_table.public_rt.id
    destination_cidr_block  = "0.0.0.0/0" # Permit all traffic (default)
    gateway_id              = aws_internet_gateway.class_4_igw.id
}
