#Declare the required versions
terraform {
  required_version = " ~> 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 4.56"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  type    = string
  default = "eks-with-terraform"
}

variable "s3_folders" {
  type        = list(any)
  description = "The list of S3 folders to create"
  default     = ["dev/eks-cluster/", "dev/app1k8s/"]
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucket_name

}
resource "aws_s3_bucket_acl" "my-bucket-acl" {
  bucket = aws_s3_bucket.my-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "myobject" {
  count                  = length(var.s3_folders)
  bucket                 = var.bucket_name
  key                    = var.s3_folders[count.index] #Creating folder
  server_side_encryption = "aws:kms"
  depends_on = [
    aws_s3_bucket.my-bucket
  ]
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}

#output

output "aws_s3_bucket_name" {
  value = aws_s3_bucket.my-bucket.id
}

output "aws_s3_bucket_ARN" {
  value = aws_s3_bucket.my-bucket.arn
}

output "aws_dynamo" {
  value = aws_dynamodb_table.dynamodb-terraform-state-lock.id
}