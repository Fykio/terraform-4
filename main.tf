# VPC module that creates the foundational network
module "vpc" {
    source   = "./modules/vpc" # Directory Path to VPC module
    vpc_cidr = "10.0.0.0/16" # CIDR block for entire VPC
    env      = "dev"
}

# Subnets module that creates both public and private subnets
module "subnets" {
    source               = "./modules/subnets"
    vpc_id               = module.vpc.vpc_id
    public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
    azs                  = ["eu-north-1a", "eu-north-1b"] # azs => Availability Zones
    env                  = "dev"
}

# Internet Gateway module for public internet access
module "igw" {
    source = "./modules/igw"
    vpc_id = module.vpc.vpc_id
    env    = "dev"
}

# NAT Gateway module for private subnet internet access
module "nat_gateway" {
    source             = "./modules/nat"
    vpc_id             = module.vpc.vpc_id
    public_subnet_ids  = module.subnets.public_subnet_ids
    private_subnet_ids = module.subnets.private_subnet_ids
    env                = "dev"
}
