resource "aws_sqs_queue" "expel-sqs-notification" {
  name                      = "ExpelMasterCloudTrailNotify"
  message_retention_seconds = 604800
}

resource "aws_sqs_queue_policy" "expel-sqs-policy" {
  queue_url = aws_sqs_queue.expel-sqs-notification.id
  policy    = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
      {
        "Sid": "__owner_statement",
        "Effect": "Allow",
        "Principal": {
          "AWS": "*"
        },
        "Action": "SQS:SendMessage",
        "Resource": "${aws_sqs_queue.expel-sqs-notification.arn}",
        "Condition": {
          "ArnLike": {
            "aws:SourceArn": "${aws_s3_bucket.expel-cloudtrail-logs.arn}"
          }
        }
      }
  ]
}
POLICY
}
