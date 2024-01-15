resource "aws_kms_key" "rds_encryption" {
  description = "KMS key for RDS encryption"
  // Add any specific configurations for your KMS key here
}

resource "aws_db_instance" "default" {
  allocated_storage                   = var.allocated_storage
  storage_type                        = var.storage_type
  engine                              = var.engine
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  db_name                             = var.db_name
  username                            = var.db_username
  password                            = var.db_password
  parameter_group_name                = aws_db_parameter_group.default.name
  db_subnet_group_name                = aws_db_subnet_group.default.name
  vpc_security_group_ids              = [var.security_group_id]
  storage_encrypted                   = true
  kms_key_id                          = aws_kms_key.rds_encryption.arn
  publicly_accessible                 = false
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = true
  multi_az                            = true
  enabled_cloudwatch_logs_exports     = ["audit", "error", "general", "slowquery"]
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_parameter_group" "default" {
  name   = "${var.db_name}-parameters"
  family = var.db_parameter_family

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }

  parameter {
    name  = "require_ssl"
    value = "1"
  }
}

resource "aws_sns_topic" "rds_alarm_topic" {
  name = "rds-alarm-topic"
}

resource "aws_cloudwatch_metric_alarm" "rds_cpu_high" {
  alarm_name          = "rds-cpu-high-${var.rds_instance_identifier}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Average"
  threshold           = var.rds_cpu_utilization_high_threshold

  dimensions = {
    DBInstanceIdentifier = aws_db_instance.default.id
  }

  alarm_description = "This alarm fires when RDS CPU utilization exceeds ${var.rds_cpu_utilization_high_threshold} percent"
  alarm_actions     = [aws_sns_topic.rds_alarm_topic.arn]
}
