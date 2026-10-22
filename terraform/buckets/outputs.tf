output "bucket_names" {
  description = "Names of the managed S3 buckets"

  value = {
    for name, bucket in aws_s3_bucket.this :
    name => bucket.bucket
  }
}

output "bucket_arns" {
  description = "ARNs of the managed S3 buckets"

  value = {
    for name, bucket in aws_s3_bucket.this :
    name => bucket.arn
  }
}

output "bronze_bucket_name" {
  value = aws_s3_bucket.this["bronze"].bucket
}

output "silver_bucket_name" {
  value = aws_s3_bucket.this["silver"].bucket
}

output "golden_bucket_name" {
  value = aws_s3_bucket.this["golden"].bucket
}

output "scripts_bucket_name" {
  value = aws_s3_bucket.this["scripts"].bucket
}
