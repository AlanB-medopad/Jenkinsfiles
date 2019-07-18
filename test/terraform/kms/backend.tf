terraform {
  backend "s3" {
    profile = "sandbox"
    region  = "eu-west-1"
    bucket  = "terraform-state.eu-west-1.services"
    key     = "sandbox/backend/test-kms"
    encrypt = "true"
    acl     = "bucket-owner-full-control"
  }
}
