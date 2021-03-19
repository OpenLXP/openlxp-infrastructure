output "eks_cluster_endpoint" {
  value = aws_eks_cluster.xse_eks_cluster.endpoint
}

output "eks_cluster_certificate_authority" {
  value = aws_eks_cluster.xse_eks_cluster.certificate_authority
}
