#Declare the required versions
terraform {
  required_version = " ~> 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 4.56.0"
    }
  }
  backend "s3" {
    bucket         = "eks-with-terraform"
    key            = "dev/eks-cluster/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}
provider "aws" {
  region = "us-east-1"
}

