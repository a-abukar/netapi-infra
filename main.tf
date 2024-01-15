provider "aws" {
  region = var.aws_region
}

# Network Module
module "network" {
  source = "./modules/network"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

# ECS Module
module "ecs" {
  source = "./modules/ecs"

  region = var.aws_region
  network_vpc_id =   module.network.vpc_id
  cluster_name      = var.ecs_cluster_name
  task_family       = var.ecs_task_family
  task_cpu          = var.ecs_task_cpu
  task_memory       = var.ecs_task_memory
  container_name    = var.ecs_container_name
  container_image   = var.ecs_container_image
  container_port    = var.ecs_container_port
  service_name      = var.ecs_service_name
  subnets           = module.network.public_subnet_ids
  security_group_id = aws_security_group.ecs_sg.id
  desired_count     = var.ecs_desired_count
  alb_security_group_id = aws_security_group.alb_sg.id
  alb_subnets           = module.network.public_subnet_ids
  cpu_utilization_high_threshold = var.ecs_cpu_utilization_high_threshold
}

# RDS Modules

module "rds" {
  source = "./modules/rds"

  allocated_storage   = var.rds_allocated_storage
  storage_type        = var.rds_storage_type
  engine              = var.rds_engine
  engine_version      = var.rds_engine_version
  instance_class      = var.rds_instance_class
  db_name             = var.rds_db_name
  db_username         = var.rds_db_username
  db_password         = var.rds_db_password
  db_parameter_family = var.rds_db_parameter_family
  subnet_ids          = module.network.private_subnet_ids
  security_group_id   = aws_security_group.rds_sg.id
  rds_instance_identifier        = var.rds_instance_identifier
  rds_cpu_utilization_high_threshold = var.rds_cpu_utilization_high_threshold
}


resource "aws_security_group" "alb_sg" {
  name        = "alb-security-group"
  description = "Security group for ALB"
  vpc_id      = module.network.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust as needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust as needed
  }
}


# Security Groups for ECS
resource "aws_security_group" "ecs_sg" {
  vpc_id = module.network.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Ingress rules based on the requirements
}

# Security Groups for RDS
resource "aws_security_group" "rds_sg" {
  vpc_id = module.network.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
}
