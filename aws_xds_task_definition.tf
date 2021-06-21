# creates the XIA task definition. container definition is defined in the *.json file
resource "aws_ecs_task_definition" "xds_task_definition" {
  family                = "xds_task_definition"
  container_definitions = file("task-definitions/xds_images.json")
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn    = "arn:aws:iam::var.aws_account:role/ecsTaskExecutionRole"
  cpu                   = "1024"
  memory                = "2048"
}
