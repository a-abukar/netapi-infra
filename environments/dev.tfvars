# Development Environment
aws_region = "us-west-2"

# VPC Configuration
vpc_cidr = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["us-west-2a", "us-west-2b"]

# ECS Configuration
ecs_cluster_name = "dev-ecs-cluster"
ecs_task_family = "dev-task-family"
ecs_task_cpu = "256"
ecs_task_memory = "512"
ecs_container_name = "dev-container"
ecs_container_image = "dev-docker-image:latest"
ecs_container_port = 80
ecs_service_name = "dev-service"
ecs_desired_count = 1
ecs_cpu_utilization_high_threshold = 60

# RDS Configuration
rds_allocated_storage = 10
rds_storage_type = "gp2"
rds_engine = "mysql"
rds_engine_version = "5.7"
rds_instance_class = "db.t2.micro"
rds_db_name = "devdatabase"
rds_db_username = "devadmin"
rds_db_password = "devsecurepassword"
rds_db_parameter_family = "mysql5.7"
rds_cpu_utilization_high_threshold = 75
rds_instance_identifier = "dev-rds-instance"
