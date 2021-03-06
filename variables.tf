variable "profile" {
  type    = string
  default = "default"
}

variable "region-management" {
  type    = string
  default = "us-east-1"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "myEcsTaskExecutionRole"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

variable "aws_account" {
  description = "aws account in which resources are being deployed"
  default     = "UNDEFINED_AWS_ACCOUNT"
}
