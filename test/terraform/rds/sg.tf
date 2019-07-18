resource "aws_security_group" "rds" {
  name        = "${var.application_name}-rds"
  vpc_id      = "${data.aws_subnet.private.0.vpc_id}"
  description = "Security group for test RDS "

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allowing access from internet
  }

  #the tags name
  tags = {
    Name        = "${var.application_name}-rds"
    Application = "${var.application_name}"
    Environment = "${var.aws_account}"
  }
}
