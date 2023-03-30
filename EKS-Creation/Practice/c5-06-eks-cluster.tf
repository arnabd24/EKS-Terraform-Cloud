# Create AWS EKS Cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = "kubemaster"
  role_arn = aws_iam_role.eks_master_role.arn
  version  = "1.25"
  vpc_config {
    subnet_ids             = module.vpc.public_subnets
    endpoint_public_access = true
    public_access_cidrs    = ["0.0.0.0/0"]
  }

  kubernetes_network_config {
    service_ipv4_cidr = "192.168.0.0/16"
  }
}
