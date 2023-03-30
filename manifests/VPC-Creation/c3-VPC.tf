module "terraform-vpc" { #module name can be anything
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
 # VPC Basic Details
 name = "my-test-vpc"
 cidr = "10.0.0.0/16"
 azs  = ["ap-south-1a","ap-south-1b"]
  private_subnets     = ["10.0.1.0/24","10.0.2.0/24"]
  public_subnets      = ["10.0.10.0/24","10.0.20.0/24"]
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  #create_database_internet_gateway_route = false
  #create_database_nat_gateway_route = false
  database_subnets    = ["10.0.30.0/24","10.0.40.0/24"]
  #NAT GW for Outbound Communication
  #enable_nat_gateway = true
  #single_nat_gateway = true
  #VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true
  public_subnet_tags = {
    Name = "Public-Subnets-dev-vpc"
  }
  private_subnet_tags = {
    Name = "Private-Subnets-dev-vpc"
  }
  database_subnet_tags = {
    Name = "Database-dev-vpc"
  }
  tags = {
    Owner = "Arnab"
    Env = "Developement"
  }
  vpc_tags = {
    Name = "vpc-dev"
  }
  
}