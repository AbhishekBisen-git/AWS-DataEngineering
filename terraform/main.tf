terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Mumbai; change if needed
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "layers" {
  for_each = toset(["bronze", "silver", "golden", "scripts"])

  bucket = "${each.key}-${data.aws_caller_identity.current.account_id}-us-east-1"

  tags = {
    Name  = each.key
    Layer = each.key
  }
}

resource "aws_s3_bucket_public_access_block" "layers" {
  for_each = aws_s3_bucket.layers

  bucket                  = each.value.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "bucket_names" {
  value = { for layer, bucket in aws_s3_bucket.layers : layer => bucket.id }
}

resource "aws_glue_catalog_database" "pipeline" {
  for_each = local.glue_databases

  name        = each.value
  description = "Glue database for the ${each.key} pipeline layer"

  location_uri = "s3://${aws_s3_bucket.layers[each.key].id}/"
}

output "glue_database_names" {
  value = {
    for layer, database in aws_glue_catalog_database.pipeline :
    layer => database.name
  }
}


