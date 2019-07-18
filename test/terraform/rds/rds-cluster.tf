resource "aws_rds_cluster" "cluster" {
  cluster_identifier              = "${var.application_name}"
  engine                          = "${var.rds_cluster_engine}"
  engine_mode                     = "${var.rds_cluster_engine_mode}"
  engine_version                  = "${var.rds_cluster_engine_version}"
  vpc_security_group_ids          = ["${aws_security_group.rds.id}"]
  database_name                   = "${var.db_name}"
  master_username                 = "${var.user_name}"
  master_password                 = "${var.rds_password}"
  backup_retention_period         = "${var.rds_backup_retention_period}"
  storage_encrypted               = true
  port                            = "3306"
  db_subnet_group_name            = "${aws_db_subnet_group.rds_cluster.name}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.rds_cluster.name}"
  preferred_backup_window         = "${var.rds_backup_window}"
  preferred_maintenance_window    = "${var.rds_maintenance_window}"
  skip_final_snapshot             = "${var.rds_cluster_skip_final_snapshot}"
  kms_key_id                      = "${data.aws_kms_alias.kms.arn}"

  # tags
  tags = {
    Name        = "${var.application_name}"
    Application = "${var.application_name}"
    Environment = "${var.aws_account}"
  }
}

resource "aws_rds_cluster_instance" "rds_cluster" {
  count                           = "${var.rds_cluster_size}"
  identifier                      = "${var.application_name}-${count.index}"
  cluster_identifier              = "${aws_rds_cluster.cluster.id}"
  instance_class                  = "${var.rds_instance_class}"
  engine                          = "${var.rds_cluster_engine}"
  engine_version                  = "${var.rds_cluster_engine_version}"
  db_parameter_group_name         = "${aws_db_parameter_group.rds_cluster.name}"
  performance_insights_enabled    = "${var.rds_performance_insights_enabled}"
  performance_insights_kms_key_id = "${data.aws_kms_alias.kms.arn}"

  # tags
  tags = {
    Name        = "${var.application_name}"
    Application = "${var.application_name}"
    Environment = "${var.aws_account}"
  }
}

resource "aws_db_subnet_group" "rds_cluster" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = ["${data.aws_subnet.private.*.id}"]

  # tags
  tags = {
    Name        = "${var.application_name}"
    Application = "${var.application_name}"
    Environment = "${var.aws_account}"
  }
}

resource "aws_db_parameter_group" "rds_cluster" {
  name   = "${var.db_name}-parameter-group"
  family = "${var.rds_cluster_family}"

  # tags
  tags = {
    Name        = "${var.application_name}"
    Application = "${var.application_name}"
    Environment = "${var.aws_account}"
  }
}

resource "aws_rds_cluster_parameter_group" "rds_cluster" {
  name   = "${var.db_name}-cluster-parameter-group"
  family = "${var.rds_cluster_family}"

  # tags
  tags = {
    Name        = "${var.application_name}"
    Application = "${var.application_name}"
    Environment = "${var.aws_account}"
  }
}
