resource "aws_kms_key" "test" {
  description         = "test data layers."
  enable_key_rotation = true

  lifecycle {
    prevent_destroy = true
  }

  # The policy cannot reference a principal that doesn't exist. As the key must be created before the EC2
  # instances that use it, we grant EC2 access in an IAM policy instead of this key policy.
  # See https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "test",
  "Statement": [
    {
      "Sid": "Allow test to administrate the key",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:${local.arn_partition}:iam::${module.info.account-id[var.aws_account]}:role/test"
      },
      "Action": [
        "kms:Create*",
        "kms:Describe*",
        "kms:Enable*",
        "kms:List*",
        "kms:Put*",
        "kms:Update*",
        "kms:Revoke*",
        "kms:Disable*",
        "kms:Get*",
        "kms:Delete*",
        "kms:TagResource",
        "kms:UntagResource",
        "kms:ScheduleKeyDeletion",
        "kms:CancelKeyDeletion",
        "kms:Generate*",
        "kms:ReEncrypt*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Allow RDS, Beanstalk, to use the key",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:${local.arn_partition}:iam::${module.info.account-id[var.aws_account]}:role/aws-service-role/rds.amazonaws.com/AWSServiceRoleForRDS",
          "arn:${local.arn_partition}:iam::${module.info.account-id[var.aws_account]}:role/aws-service-role/elasticbeanstalk.amazonaws.com/AWSServiceRoleForElasticBeanstalk",
          "arn:${local.arn_partition}:iam::${module.info.account-id[var.aws_account]}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
        ]
      },
      "Action": [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Allow attachment of persistent resources",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:${local.arn_partition}:iam::${module.info.account-id[var.aws_account]}:role/aws-service-role/rds.amazonaws.com/AWSServiceRoleForRDS",
          "arn:${local.arn_partition}:iam::${module.info.account-id[var.aws_account]}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling",
          "arn:${local.arn_partition}:iam::${module.info.account-id[var.aws_account]}:role/aws-service-role/elasticbeanstalk.amazonaws.com/AWSServiceRoleForElasticBeanstalk"
        ]
      },
      "Action": [
        "kms:CreateGrant",
        "kms:ListGrants",
        "kms:RevokeGrant"
      ],
      "Resource": "*",
      "Condition": {
        "Bool": {
          "kms:GrantIsForAWSResource": "true"
        }
      }
    }
  ]
}
EOF

  tags {
    Name        = "${var.app_name}"
    Company     = "Medopad"
    Environment = "${var.aws_account}"
    Application = "${var.app_name}"
  }
}

resource "aws_kms_alias" "test" {
  name          = "alias/backend/test"
  target_key_id = "${aws_kms_key.test.key_id}"
}
