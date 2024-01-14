variable "allocated_storage" {
  description = "The allocated storage size for the RDS instance"
  type        = number
}

variable "storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
}

variable "db_parameter_family" {
  description = "The family of the DB parameter group"
  type        = string
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs for the RDS instance"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the VPC security group for the RDS instance"
  type        = string
}
