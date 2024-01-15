# Production Environment
aws_region = "us-west-2"

# VPC Configuration
vpc_cidr = "10.2.0.0/16"
public_subnet_cidrs = ["10.2.1.0/24", "10.2.2.0/24"]
private_subnet_cidrs = ["10.2.3.0/24", "10.2.4.0/24"]
availability_zones = ["us-west-2a", "us-west-2b"]

# ECS Configuration
ecs_cluster_name = "prod-ecs-cluster"
ecs_task_family = "prod-task-family"
ecs_task_cpu = "512"
ecs_task_memory = "1024"
ecs_container_name = "prod-container"
ecs_container_image = "prod-docker-image:latest"
ecs_container_port = 80
ecs_service_name = "prod-service"
ecs_desired_count = 2
ecs_cpu_utilization_high_threshold = 80

# RDS Configuration
rds_allocated_storage = 20
rds_storage_type = "gp2"
rds_engine = "mysql"
rds_engine_version = "5.7"
rds_instance_class = "db.t2.medium"
rds_db_name = "proddatabase"
rds_db_username = "prodadmin"
rds_db_password = "prodsecurepassword"
rds_db_parameter_family = "mysql5.7"
rds_instance_identifier = "prod-rds-instance"
rds_cpu_utilization_high_threshold = 85
