# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  #version = "~> 3.11"

  # VPC Basic Details
  name           = "my-vpc"
  cidr           = "10.0.0.0/16"
  azs            = ["us-east-1a", "us-east-1b"]
  public_subnets = ["10.0.0.0/24", "10.0.1.0/24"]

  # VPC DNS Parameters
  enable_dns_hostnames    = true
  enable_dns_support      = true
  map_public_ip_on_launch = true

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type                               = "Public Subnets"
    "kubernetes.io/role/elb"           = 1
    "kubernetes.io/cluster/kubemaster" = "shared"
  }
  private_subnet_tags = {
    Type                               = "private-subnets"
    "kubernetes.io/role/internal-elb"  = 1
    "kubernetes.io/cluster/kubemaster" = "shared"
  }

}