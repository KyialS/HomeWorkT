provider "aws" {
  region = terraform.workspace == "dev" ? "us-east-1" : terraform.workspace == "stage" ? "us-east-2" : "us-west-1"
}

resource "aws_s3_bucket" "s3" {
  count = terraform.workspace == "dev" || terraform.workspace == "stage" ? 1 : 1
tags = {
  "Name" = "${terraform.workspace}-s3-k"
}  
}

resource "aws_vpc" "vpc_prod" {
  count = terraform.workspae == "prod" ? 1:0
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name"= "${terraform.workspace}-vpc_prod_k"
  } 
}

output "current_workspace" {
  value="${terraform.workspace}"
  
}