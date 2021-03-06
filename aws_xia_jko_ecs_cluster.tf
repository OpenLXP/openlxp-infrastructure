# creates the ECS cluster XIA
resource "aws_ecs_cluster" "xia_jko_cluster" {
  name = "xia_jko_cluster"
}

# creates the ECS service
resource "aws_ecs_service" "xia_jko_service" {
  name            = "xia_jko"
  cluster         = aws_ecs_cluster.xia_jko_cluster.id
  task_definition = aws_ecs_task_definition.xia_jko_task_definition.arn
  desired_count   = 3
  iam_role        = aws_iam_role.ecs_task_role.arn
  depends_on      = [aws_iam_role_policy.ecs_iam_role_policy]
  launch_type     = "FARGATE"

  network_configuration {
    subnets = [aws_subnet.xia_subnet1_useast1.id]
  }
}
