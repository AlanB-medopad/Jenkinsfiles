#RDS CLUSTER

output "db_rw_endpoint" {
  description = "The db writer cluster"
  value       = "${aws_rds_cluster.cluster.endpoint}"
}

output "db_ro_endpoint" {
  description = "The db writer cluster"
  value       = "${aws_rds_cluster.cluster.reader_endpoint}"
}
