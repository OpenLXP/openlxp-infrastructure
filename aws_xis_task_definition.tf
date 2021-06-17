# creates the XIS task definition. container definition is defined in the *.json file
resource "aws_ecs_task_definition" "xis_task_definition" {
  family                = "xis_task_definition"
  container_definitions = file("task-definitions/xis_images.json")
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn    = "arn:aws:iam::var.aws_account:role/ecsTaskExecutionRole"
}
