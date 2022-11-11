variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  type        = string
  description = "The name of the S3 bucket to store the Lambda function code"
  default     = ""
}

variable "s3_object_key" {
  type        = string
  description = "The S3 object key, the zip file name"
  default     = ""
}

variable "output_zip" {
  type        = string
  description = "The zip output"
  default     = ""
}

variable "lambda_functions" {
  type        = any
  description = "Lambda functions"
  default     = ""
}
