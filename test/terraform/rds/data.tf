data "aws_subnet" "private" {
  count = "${length("${local.private_subnet_names}")}"

  filter {
    name   = "tag:Name"
    values = ["${element(local.private_subnet_names, count.index)}"]
  }
}

data "aws_kms_alias" "kms" {
  name = "alias/backend/test-kms"
}
