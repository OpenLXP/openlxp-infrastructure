resource "aws_ecs_cluster" "dau_xia_cluster" {
  name = "dau_xia_cluster"
}

resource "aws_ecs_service" "dau_xia_service" {
  name            = "dau_xia"
  cluster         = aws_ecs_cluster.dau_xia_cluster.id
  task_definition = aws_ecs_task_definition.dau_xia_task_definition.arn
  desired_count   = 3
  iam_role        = aws_iam_role.ecs_task_role.arn
  depends_on      = [aws_iam_role_policy.ecs_task_role]
  launch_type     = "FARGATE"

#  network_configuration {
#    subnets = aws_subnet.xia_subnet_useast1
#  }

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-1a, us-east-1b]"
  }
}
