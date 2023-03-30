variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"

}

variable "instance_keypair" {
  description = "aws instance key pair to be associated"
  type        = string
  default     = "kubernetes"
}