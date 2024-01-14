# Testing Environment
aws_region = "us-west-2"

# VPC Configuration
vpc_cidr = "10.1.0.0/16"
public_subnet_cidrs = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.3.0/24", "10.1.4.0/24"]
availability_zones = ["us-west-2a", "us-west-2b"]

# ECS Configuration
ecs_cluster_name = "test-ecs-cluster"
ecs_task_family = "test-task-family"
ecs_task_cpu = "256"
ecs_task_memory = "512"
ecs_container_name = "test-container"
ecs_container_image = "test-docker-image:latest"
ecs_container_port = 80
ecs_service_name = "test-service"
ecs_desired_count = 1

# RDS Configuration
rds_allocated_storage = 10
rds_storage_type = "gp2"
rds_engine = "mysql"
rds_engine_version = "5.7"
rds_instance_class = "db.t2.micro"
rds_db_name = "testdatabase"
rds_db_username = "testadmin"
rds_db_password = "testsecurepassword"
rds_db_parameter_family = "mysql5.7"
