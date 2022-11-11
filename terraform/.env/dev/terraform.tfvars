aws_region     = "us-east-1"
s3_bucket_name = "springboot-infracost-demo-bucket"
s3_object_key  = "demo-0.0.1-SNAPSHOT-aws.jar"

lambda_functions = {
  demo = {
    runtime                = "java11"
    handler                = "org.springframework.cloud.function.adapter.aws.FunctionInvoker"
    function_name_variable = "demo"
    ephemeral_storage      = 512
    memory_size            = 512
  }
}
