# creates the XIA task definition. container definition is defined in the *.json file
resource "aws_ecs_task_definition" "xia_aetc_task_definition" {
  family                = "xia_aetc_task_definition"
  container_definitions = file("task-definitions/xia_aetc_images.json")
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn    = "arn:aws:iam::var.aws_account:role/ecsTaskExecutionRole"
}
