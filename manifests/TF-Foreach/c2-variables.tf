variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"

}

variable "instance_keypair" {
  description = "aws instance key pair to be associated"
  type        = string
  default     = "terraform-key"
}

variable "instance_type_list" {
  description = "EC2 Instance type list"
  type = list(string)
  default = [ "t2.micro" , "t3.micro" , "t3.large"]
}

variable "instance_type_map" {
  description = "EC2 Instance type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa" = "t2.small"
    "prod" = "t2.large"
  }
}