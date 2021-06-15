# create ecs task iam role

resource "aws_iam_role" "ecs_task_role" {
  name = "ecs_task_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name = "ecs role"
  }
}

# create ecs iam role policy

resource "aws_iam_role_policy" "ecs_iam_role_policy" {
  name = "ecs_iam_role_policy"
  role = aws_iam_role.ecs_role.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "ecs:Describe*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}

# create iam role for ecs cluster

resource "aws_iam_role" "ecs_role" {
  name = "ecs_role"

  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ecs.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF
}

# create iam role for eks cluster

resource "aws_iam_role" "aws_eks_iam_role" {
  name = "aws_eks_iam_role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "aws_xse-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.aws_eks_iam_role.name
}

# create iam role for eks node group

resource "aws_iam_role" "aws_eks_ng_iam_role" {
  name = "aws_eks_ng_iam_role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

#resource "aws_iam_role_policy_attachment" "aws_eks_ng-AmazonEKSWorkerNodePolicy" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#  role       = aws_iam_role.aws_eks_ng_iam_role.name
#}

#resource "aws_iam_role_policy_attachment" "aws_eks_ng-AmazonEKS_CNI_Policy" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#  role       = aws_iam_role.aws_eks_ng_iam_role.name
#}

#resource "aws_iam_role_policy_attachment" "aws_eks_ng-AmazonEC2ContainerRegistryReadOnly" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#  role       = aws_iam_role.aws_eks_ng_iam_role.name
#}
