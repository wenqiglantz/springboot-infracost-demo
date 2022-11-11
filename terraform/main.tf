#######################################
# Provider
#######################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.39.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

#######################################
# Lambda module
#######################################
module "lambda" {
  source           = "github.com/wenqiglantz/reusable-workflows-modules/terraform/modules/lambda"
  s3_bucket_name   = var.s3_bucket_name
  s3_object_key    = var.s3_object_key
  lambda_functions = var.lambda_functions
}
