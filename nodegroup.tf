resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.xse_eks_node.name
  node_group_name = "xse_eks_node"
  node_role_arn   = aws_iam_role.xse_eks_node.arn
  subnet_ids      = ["subnet-", "subnet-"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
