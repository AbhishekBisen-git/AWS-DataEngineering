resource "aws_s3_bucket" "this" {
  for_each = var.bucket_names

  bucket = each.value

  tags = {
    ManagedBy = "Terraform"
    Component = "storage"
    Name      = each.key
  }
}

# Versioning is intentionally disabled.
resource "aws_s3_bucket_versioning" "this" {
  for_each = var.bucket_names

  bucket = aws_s3_bucket.this[each.key].id

  versioning_configuration {
    status = "Disabled"
  }
}

# Recommended baseline controls for production buckets.
resource "aws_s3_bucket_public_access_block" "this" {
  for_each = var.bucket_names

  bucket = aws_s3_bucket.this[each.key].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
