resource "aws_iam_policy" "ExpelAPIPolicy" {
  name        = "ExpelAPIPolicy"
  path        = "/"
  description = "used with expel.io"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeInstances",
        "ec2:DescribeRegions",
        "ec2:DescribeSecurityGroups",
        "iam:List*",
        "iam:Get*",
        "rds:DescribeDBInstances",
        "rds:ListTagsForResource",
        "organizations:ListAccounts",
        "ec2:DescribeVolumes",
        "ecs:DescribeTaskDefinition",
        "ecs:ListTaskDefinitions",
        "lambda:GetFunction",
        "lambda:ListFunctions",
        "lightsail:GetInstances",
        "lightsail:GetRegions",
        "s3:ListAllMyBuckets",
        "cloudtrail:GetTrailStatus",
        "cloudtrail:DescribeTrails",
        "config:ListDiscoveredResources",
        "config:GetDiscoveredResourceCounts",
        "eks:DescribeCluster",
        "eks:ListClusters",
        "ecs:ListContainerInstances",
        "ecs:DescribeContainerInstances",
        "ecs:DescribeClusters",
        "ecs:ListClusters"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "sqs:DeleteMessage",
        "sqs:DeleteMessageBatch",
        "sqs:ReceiveMessage",
        "sqs:GetQueueAttributes"
      ],
      "Resource": "${aws_sqs_queue.expel-sqs-notification.arn}"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": "${aws_s3_bucket.expel-cloudtrail-logs.arn}/*"
    }
  ]
}
POLICY
}


resource "aws_iam_policy_attachment" "ExpelAPIPolicy-policy-attachment" {
  name       = "ExpelAPIPolicy-policy-attachment"
  policy_arn = aws_iam_policy.ExpelAPIPolicy.arn
  groups     = []
  users      = []
  roles      = ["ExpelServiceRole"]
}

resource "aws_iam_role" "ExpelServiceRole" {
  name        = "ExpelServiceRole"
  description = "access for expel.io"
  path        = "/"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::012205512454:root"
        },
        "Action" : "sts:AssumeRole",
        "Condition" : {
          "StringEquals" : {
            "sts:ExternalId" : "08f01dd0-4db2-4aa4-9fee-1d518485d73a"
          }
        }
      }
    ]
  })
}
