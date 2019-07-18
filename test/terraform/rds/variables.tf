# Mandatory variables
variable "aws_account" {
  description = "AWS account name."
  type        = "string"
}

variable "aws_region" {
  description = "AWS region."
  type        = "string"
}

variable "application_name" {
  description = "Name of application"
  type        = "string"
}

variable "user_name" {
  description = "username for rds database"
  type        = "string"
  default     = "test"
}

variable "rds_password" {
  description = "password for rds database"
  type        = "string"
}

#RDS VARIABLES

variable "db_name" {
  description = "Name of Database"
  type        = "string"
}

variable "rds_engine" {
  description = "The database engine to use."
  type        = "string"
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "The engine version to use."
  type        = "string"
  default     = "5.7.23"
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with."
  type        = "string"
  default     = "5.7"
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance."
  type        = "string"
  default     = "db.t2.medium"
}

variable "family" {
  description = "The family of the DB parameter group."
  type        = "string"
  default     = "mysql5.7"
}

variable "rds_allocated_storage" {
  description = "The allocated storage in gigabytes."
  type        = "string"
  default     = "100"
}

variable "rds_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled."
  type        = "string"
  default     = "02:10-02:40"
}

variable "rds_maintenance_window" {
  description = "The window to perform maintenance in."
  type        = "string"
  default     = "sat:00:37-sat:01:07"
}

variable "rds_allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed."
  type        = "string"
  default     = "false"
}

variable "rds_apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  type        = "string"
  default     = "false"
}

variable "rds_backup_retention_period" {
  description = "The days to retain backups for."
  type        = "string"
  default     = "14"
}

variable "rds_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible."
  type        = "string"
  default     = false
}

#RDS CLUSTER VARIABLES

variable "rds_cluster_engine" {
  description = "The name of the cluaster database engine to be used for this DB cluster."
  type        = "string"
  default     = "aurora-mysql"
}

variable "rds_cluster_engine_mode" {
  description = "The cluster database engine mode."
  type        = "string"
  default     = "provisioned"
}

variable "rds_cluster_engine_version" {
  description = "The cluster database engine version."
  type        = "string"
  default     = "5.7"
}

variable "rds_cluster_family" {
  description = "The family of the DB cluster parameter group."
  type        = "string"
  default     = "aurora-mysql5.7"
}

variable "rds_cluster_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted."
  type        = "string"
  default     = "true"
}

variable "rds_cluster_size" {
  description = "This is numeber of db_instances."
  type        = "string"
  default     = "2"
}

variable "rds_performance_insights_enabled" {
  description = "Specifies whether Performance Insights is enabled or not."
  type        = "string"
  default     = "true"
}
