# creates the ECS cluster XMS
resource "aws_ecs_cluster" "xms_cluster" {
  name = "xms_cluster"
}

# creates the ECS service
resource "aws_ecs_service" "xms_service" {
  name            = "xms"
  cluster         = aws_ecs_cluster.xms_cluster.id
  task_definition = aws_ecs_task_definition.xms_task_definition.arn
  desired_count   = 3
  iam_role        = aws_iam_role.ecs_task_role.arn
  depends_on      = [aws_iam_role_policy.ecs_iam_role_policy]
  launch_type     = "FARGATE"

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-1a, us-east-1b]"
  }
}
