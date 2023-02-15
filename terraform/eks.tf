# eks cluster IAM Role생성
resource "aws_iam_role" "eks-cluster-role" {
  name = "eks-cluster-role"
  
  # 클러스터 역활의 정책 정의
  # AWS EKS 정책 문서 참고해서 학습필요
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

# EKS 생성시 필요로하는 policy가 있음.
# 그 policy를 계정과 할당해줘야함.
resource "aws_iam_role_policy_attachment" "cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-cluster-role.name
}

resource "aws_iam_role_policy_attachment" "cluster-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks-cluster-role.name
}

# eks-Cluster 생성
# name: awesome-cluster
# role : 위에서 만든 롤을 할당
# subnet : ??
resource "aws_eks_cluster" "awesome-cluster" {
  name     = "awesome-cluster"
  role_arn = aws_iam_role.eks-cluster-role.arn
  # eks subnet
  # EKS 서브넷과 연결하는 서브넷? 학습필요
  vpc_config {
    subnet_ids = [aws_subnet.pub_sub_a.id, aws_subnet.pub_sub_c.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  # policy 설정된 후에 nodegorup subnet 할당하겠다.
  depends_on = [
    aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster-AmazonEKSVPCResourceController,
  ]
}

# EKS 생성 완료되었는지 EKS endpoint 출력해서 확인하겠다.
output "endpoint" {
  value = aws_eks_cluster.awesome-cluster.endpoint
}