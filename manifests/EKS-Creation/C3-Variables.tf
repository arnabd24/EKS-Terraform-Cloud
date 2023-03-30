# VPC Input Variables

# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type = string 
  default = "kubernetes-VPC"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string 
  default = "10.0.0.0/16"
}
/*
# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}*/

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type = list(string)
  default = ["10.0.10.0/24", "10.0.11.0/24"]
}

#EKS Variables

variable "EKS_Cluster_Name" {
  description = "Cluster-Name-EKS"
  type = string
  default = "viatris-sitecore"
}



