#######################################
# Provider
#######################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }
  required_version = "~> 1.3.6"
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
