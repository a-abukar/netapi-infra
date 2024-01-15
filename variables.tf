# AWS Region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

# VPC Configuration
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "The list of CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "The list of CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

# ECS Configuration
variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "my-ecs-cluster"
}

variable "ecs_task_family" {
  description = "The family of the ECS task"
  type        = string
  default     = "my-task-family"
}

variable "ecs_task_cpu" {
  description = "The amount of CPU to allocate for the task"
  type        = string
  default     = "256"
}

variable "ecs_task_memory" {
  description = "The amount of memory (in MiB) to allocate for the task"
  type        = string
  default     = "512"
}

variable "ecs_container_name" {
  description = "The name of the container"
  type        = string
  default     = "my-container"
}

variable "ecs_container_image" {
  description = "The image of the container"
  type        = string
  default     = "my-docker-image:latest"
}

variable "ecs_container_port" {
  description = "The port on which the container listens"
  type        = number
  default     = 80
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
  default     = "my-service"
}

variable "ecs_desired_count" {
  description = "The desired number of instances of the task definition to run"
  type        = number
  default     = 2
}

# RDS Configuration
variable "rds_allocated_storage" {
  description = "The allocated storage size for the RDS instance"
  type        = number
  default     = 20
}

variable "rds_storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
  default     = "gp2"
}

variable "rds_engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "5.7"
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t2.micro"
}

variable "rds_db_name" {
  description = "The name of the database"
  type        = string
  default     = "mydatabase"
}

variable "rds_db_username" {
  description = "Username for the database"
  type        = string
  default     = "admin"
}

variable "rds_db_password" {
  description = "Password for the database"
  type        = string
  default     = "securepassword"
}

variable "rds_db_parameter_family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = "mysql5.7"
}

variable "ecs_cpu_utilization_high_threshold" {
  description = "CPU utilization threshold for ECS alarm"
  type        = number
}

variable "rds_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "rds_cpu_utilization_high_threshold" {
  description = "CPU utilization threshold for RDS alarm"
  type        = number
}

variable "ecs_max_capacity" {
  description = "Maximum number of tasks for ECS auto-scaling"
  type        = number
}

variable "ecs_min_capacity" {
  description = "Minimum number of tasks for ECS auto-scaling"
  type        = number
}

variable "ecs_cpu_scale_up_threshold" {
  description = "CPU utilization percentage to trigger scale up"
  type        = number
}

variable "ecs_cpu_scale_down_threshold" {
  description = "CPU utilization percentage to trigger scale down"
  type        = number
}
