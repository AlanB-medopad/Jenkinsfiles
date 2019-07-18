module "db" {
  source = "git@github.com:terraform-aws-modules/terraform-aws-rds.git?ref=v1.21.0"

  # RDS DB_INSTANCE REQUIRED
  engine             = "${var.rds_engine}"
  engine_version     = "${var.rds_engine_version}"
  allocated_storage  = "${var.rds_allocated_storage}"
  backup_window      = "${var.rds_backup_window}"
  instance_class     = "${var.rds_instance_class}"
  identifier         = "${var.application_name}"
  maintenance_window = "${var.rds_maintenance_window}"
  username           = "${var.user_name}"
  password           = "${var.rds_password}"
  port               = "3306"

  # DB parameter group
  family = "${var.family}"

  # DB option group
  major_engine_version = "${var.major_engine_version}"

  # RDS CONFIG optional
  name                    = "${var.db_name}"
  backup_retention_period = "${var.rds_backup_retention_period}"
  publicly_accessible     = "${var.rds_publicly_accessible}"

  # DB subnet group
  subnet_ids = ["${data.aws_subnet.private.*.id}"]
  multi_az   = true

  vpc_security_group_ids = ["${aws_security_group.rds.id}"]

  # tags
  tags = {
    Name        = "${var.application_name}"
    Application = "${var.application_name}"
    Environment = "${var.aws_account}"

  }
}
