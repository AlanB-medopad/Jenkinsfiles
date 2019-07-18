output "arn" {
  value = "${aws_kms_key.test.arn}"
}

output "key_id" {
  value = "${aws_kms_key.test.key_id}"
}
