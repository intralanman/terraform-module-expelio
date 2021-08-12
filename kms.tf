resource "aws_kms_key" "expel" {
  description         = "The key created by CloudTrail to encrypt log files. Created Wed Jul 21 21:52:18 UTC 2021"
  key_usage           = "ENCRYPT_DECRYPT"
  is_enabled          = true
  enable_key_rotation = false


  policy = jsonencode({
    "Version" : "2012-10-17",
    "Id" : "Key policy created by CloudTrail",
    "Statement" : [{
      "Sid" : "Enable IAM User Permissions",
      "Effect" : "Allow",
      "Principal" : {
        "AWS" : ["${data.aws_caller_identity.current.arn}", "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      },
      "Action" : "kms:*",
      "Resource" : "*"
      }, {
      "Sid" : "Allow CloudTrail to encrypt logs",
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "cloudtrail.amazonaws.com"
      },
      "Action" : "kms:GenerateDataKey*",
      "Resource" : "*",
      "Condition" : {
        "StringLike" : {
          "kms:EncryptionContext:aws:cloudtrail:arn" : "arn:aws:cloudtrail:*:${data.aws_caller_identity.current.account_id}:trail/*"
        }
      }
      }, {
      "Sid" : "Allow CloudTrail to describe key",
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "cloudtrail.amazonaws.com"
      },
      "Action" : "kms:DescribeKey",
      "Resource" : "*"
      }, {
      "Sid" : "Allow principals in the account to decrypt log files",
      "Effect" : "Allow",
      "Principal" : {
        "AWS" : "*"
      },
      "Action" : ["kms:Decrypt", "kms:ReEncryptFrom"],
      "Resource" : "*",
      "Condition" : {
        "StringEquals" : {
          "kms:CallerAccount" : "${data.aws_caller_identity.current.account_id}"
        },
        "StringLike" : {
          "kms:EncryptionContext:aws:cloudtrail:arn" : "arn:aws:cloudtrail:*:${data.aws_caller_identity.current.account_id}:trail/*"
        }
      }
      }, {
      "Sid" : "Allow alias creation during setup",
      "Effect" : "Allow",
      "Principal" : {
        "AWS" : "*"
      },
      "Action" : "kms:CreateAlias",
      "Resource" : "*",
      "Condition" : {
        "StringEquals" : {
          "kms:ViaService" : "ec2.eu-central-1.amazonaws.com",
          "kms:CallerAccount" : "${data.aws_caller_identity.current.account_id}"
        }
      }
      }, {
      "Sid" : "Enable cross account log decryption",
      "Effect" : "Allow",
      "Principal" : {
        "AWS" : "*"
      },
      "Action" : ["kms:Decrypt", "kms:ReEncryptFrom"],
      "Resource" : "*",
      "Condition" : {
        "StringEquals" : {
          "kms:CallerAccount" : "${data.aws_caller_identity.current.account_id}"
        },
        "StringLike" : {
          "kms:EncryptionContext:aws:cloudtrail:arn" : "arn:aws:cloudtrail:*:${data.aws_caller_identity.current.account_id}:trail/*"
        }
      }
    }]
  })
}

resource "aws_kms_alias" "expel-cloudtrail" {
  name          = "alias/expel-cloudtrail"
  target_key_id = aws_kms_key.expel.id
}
