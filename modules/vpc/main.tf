# creates the VPC with the specified CIDR block
# `CIDR block` is the IP Address range for the VPC
resource "aws_vpc" "class_4" {
    cidr_block            = var.vpc_cidr
    enable_dns_support    = true
    enable_dns_hostnames  = true

    # tag the VPC with the environment name
    tags = {
      Name = "${var.env}-vpc"
    }
}

# creates DHCP options set for the VPC to use AWS-provided DNS servers
# Dynamic Host Configuration Protocol configures how instances get DNS info
resource "aws_vpc_dhcp_options" "class_4_dhcp" {
    domain_name_servers = ["AmazonProvidedDNS"]

    # tag the DHCP with the environment name
    tags = {
      Name = "${var.env}-dhcp"
    }
}

# associates the DHCP options set with our VPC
resource "aws_vpc_dhcp_options_association" "class_4_dhcp_assoc" {
    vpc_id          = aws_vpc.class_4.id
    dhcp_options_id = aws_vpc_dhcp_options.class_4_dhcp.id 
}
