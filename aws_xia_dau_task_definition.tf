# creates the XIA task definition. container definition is defined in the *.json file
resource "aws_ecs_task_definition" "xia_dau_task_definition" {
  family                = "xia_dau_task_definition"
  container_definitions = file("task-definitions/dau_xia_images.json")
  network_mode          = "awsvpc"
  execution_role_arn    = "arn:aws:iam::aws account:role/ecsTaskExecutionRole"

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-1a, us-east-1b]"
  }
}

