
resource "aws_glue_catalog_database" "bronze" {
  catalog_id  = "992382507359"
  name        = "yt_pipeline_bronze_dev"
  description = "Bronze layer database for the YT data pipeline"
}

resource "aws_glue_catalog_database" "silver" {
  catalog_id  = "992382507359"
  name        = "yt_pipeline_silver_dev"
  description = "Silver layer database for the YT data pipeline"
}

resource "aws_glue_catalog_database" "gold" {
  catalog_id  = "992382507359"
  name        = "yt_pipeline_gold_prod"
  description = "Gold layer database for the YT data pipeline"
}
