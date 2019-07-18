locals {
  "arn_partition" = "${element(split(":", data.aws_caller_identity.this.arn), 1)}"
}
