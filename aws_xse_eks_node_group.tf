# create eks node groups for the eks cluster
resource "aws_eks_node_group" "aws_eks_xse_ng" {
  cluster_name    = aws_eks_cluster.aws_xse_eks_cluster.name
  node_group_name = "aws_eks_xse_ng"
  node_role_arn   = aws_iam_role.aws_eks_ng_iam_role.arn
  subnet_ids      = [aws_subnet.xse_subnet_useast1.id, aws_subnet.xse_subnet2_useast1.id,]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.aws_eks_ng-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.aws_eks_ng-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.aws_eks_ng-AmazonEC2ContainerRegistryReadOnly,
  ]
}
