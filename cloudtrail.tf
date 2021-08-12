resource "aws_cloudtrail" "expel" {
  name                       = "GlobalCloudTrail"
  s3_bucket_name             = aws_s3_bucket.expel-cloudtrail-logs.id
  is_multi_region_trail      = true
  enable_log_file_validation = true
  kms_key_id                 = aws_kms_key.expel.arn
}
