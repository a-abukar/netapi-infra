variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "task_family" {
  description = "The family of the ECS task"
  type        = string
}

variable "task_cpu" {
  description = "The amount of CPU to allocate for the task"
  type        = string
}

variable "task_memory" {
  description = "The amount of memory (in MiB) to allocate for the task"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "container_image" {
  description = "The image of the container"
  type        = string
}

variable "container_port" {
  description = "The port on which the container listens"
  type        = number
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "subnets" {
  description = "The subnets for the ECS tasks"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the ECS service"
  type        = string
}

variable "desired_count" {
  description = "The desired number of instances of the task definition to run"
  type        = number
}
