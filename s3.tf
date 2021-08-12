resource "aws_s3_bucket" "expel-cloudtrail-logs" {
  bucket = "aws-cloudtrail-logs-${data.aws_caller_identity.current.account_id}-5bba41de"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.expel.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_policy" "expel-cloudtrail-logs-policy" {
  bucket = aws_s3_bucket.expel-cloudtrail-logs.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AWSCloudTrailAclCheck20150319",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:GetBucketAcl",
      "Resource": "${aws_s3_bucket.expel-cloudtrail-logs.arn}"
    },
    {
      "Sid": "AWSCloudTrailWrite20150319",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:PutObject",
      "Resource": "${aws_s3_bucket.expel-cloudtrail-logs.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": "bucket-owner-full-control"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_notification" "expel" {
  bucket = aws_s3_bucket.expel-cloudtrail-logs.id
  queue {
    queue_arn = aws_sqs_queue.expel-sqs-notification.arn
    events    = ["s3:ObjectCreated:*"]
  }
}
