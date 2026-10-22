variable "bucket_names" {
  description = "Existing S3 bucket names managed by this component"

  type = map(string)

  default = {
    silver  = "silver-992382507359-us-east-1"
    scripts = "scripts-992382507359-us-east-1"
    golden  = "golden-992382507359-us-east-1"
    bronze  = "bronze-992382507359-us-east-1"
  }
}
