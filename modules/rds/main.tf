resource "aws_kms_key" "rds_encryption" {
  description = "KMS key for RDS encryption"
  // Add any specific configurations for your KMS key here
}

resource "aws_db_instance" "default" {
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = aws_db_parameter_group.default.name
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [var.security_group_id]
  storage_encrypted      = true
  kms_key_id             = aws_kms_key.rds_encryption.arn
  publicly_accessible    = false
  skip_final_snapshot    = true
  iam_database_authentication_enabled = true
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
      name = "require_ssl"
      value = "1"
  }
}


