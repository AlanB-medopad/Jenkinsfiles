#RDS

output "db_parameter_group_id" {
  description = "The id of db parameter group "
  value       = "${module.db.this_db_parameter_group_id}"
}

output "db_parameter_group_arn" {
  description = "The arn of db parameter group"
  value       = "${module.db.this_db_parameter_group_arn}"
}
