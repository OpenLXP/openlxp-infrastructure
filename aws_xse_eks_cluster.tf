# create elastic kubernetes cluster for the xse elasticsearch component
resource "aws_eks_cluster" "aws_xse_eks_cluster" {
  name     = "aws_xse_eks_cluster"
  role_arn = aws_iam_role.aws_eks_iam_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.xse_subnet_useast1.id, aws_subnet.xse_subnet2_useast1.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.aws_xse-AmazonEKSClusterPolicy,
  ]
}


output "endpoint" {
  value = aws_eks_cluster.aws_xse_eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.aws_xse_eks_cluster.certificate_authority[0].data
}
