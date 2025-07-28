# Terraform AWS VPC Setup

## Scripts Layout

modules/
  ├── igw/
  │    ├── main.tf
  |    ├── outputs.tf
  │    └── variables.tf
  ├── nat/
  |    ├── main.tf
  |    ├── outputs.tf
  |    └── variables.tf
  ├── subnets/
  │    ├── main.tf
  │    ├── outputs.tf
  │    └── variables.tf
  └── vpc/
       ├── main.tf
       ├── outputs.tf
       └── variables.tf
main.tf
provider.tf

## Permissions Policies

AmazonEC2FullAccess
AmazonVPCFullAccess
AmazonRoute53FullAccess
