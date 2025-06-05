  output "s3_bucket_arn" {
      value = aws_s3_bucket.s3testmodule.arn
      description = "The ARN of the S3 bucket."
    }