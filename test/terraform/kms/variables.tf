variable "aws_account" {
  description = "AWS account name."
  type        = "string"
}

variable "aws_region" {
  description = "AWS region."
  type        = "string"
}

variable "app_name" {
  description = "Application name."
  type        = "string"
  default     = "test"
}

variable "app_name_short" {
  description = "Short application name."
  type        = "string"
  default     = "test"
}
