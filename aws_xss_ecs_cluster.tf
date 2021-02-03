# creates the ECS cluster for XSS
resource "aws_ecs_cluster" "xss_cluster" {
  name = "xss_cluster"
}

# creates the ECS service
resource "aws_ecs_service" "xss_service" {
  name            = "xss_service"
  cluster         = aws_ecs_cluster.xss_cluster.id
  task_definition = aws_ecs_task_definition.xss_task_definition.arn
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

