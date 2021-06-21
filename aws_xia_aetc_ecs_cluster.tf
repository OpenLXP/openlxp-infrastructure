# creates the ECS cluster XIA
resource "aws_ecs_cluster" "xia_aetc_cluster" {
  name = "xia_aetc_cluster"
}

# creates the ECS service
resource "aws_ecs_service" "xia_aetc_service" {
  name            = "xia_aetc"
  cluster         = aws_ecs_cluster.xia_aetc_cluster.id
  task_definition = aws_ecs_task_definition.xia_aetc_task_definition.arn
  desired_count   = 3
  iam_role        = aws_iam_role.ecs_task_role.arn
  depends_on      = [aws_iam_role_policy.ecs_iam_role_policy]
  launch_type     = "FARGATE"

  network_configuration {
    subnets = [aws_subnet.xia_subnet2_useast1.id]
  }
}
