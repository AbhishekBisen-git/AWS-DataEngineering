locals {
  glue_databases = {
    bronze = "yt_pipeline_bronze_dev"
    silver = "yt_pipeline_silver_dev"
    golden = "yt_pipeline_gold_prod"
  }
}
