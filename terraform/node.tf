# Worker node role
# nodegorup 롤설정
resource "aws_iam_role" "Node-Group-Role" {
  name = "EKSNodeGroupRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# NodeGroup 관리를 위해 가져야할 Policy를 계정에 할당
resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.Node-Group-Role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.Node-Group-Role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.Node-Group-Role.name
}

# Node Group 생성
# nodeGroup name : t3_large-node_group
resource "aws_eks_node_group" "node-ec2" {
  cluster_name    = aws_eks_cluster.awesome-cluster.name
  node_group_name = "t3_large-node_group"
  node_role_arn   = aws_iam_role.Node-Group-Role.arn
  subnet_ids      = [aws_subnet.node_sub_a.id, aws_subnet.node_sub_c.id]

  tags = {
    "k8s.io/cluster-autoscaler/enabled"         = "true"
    "k8s.io/cluster-autoscaler/awesome-cluster" = "owned"
  }
  
  scaling_config {
    desired_size = 2
    max_size     = 3 
    min_size     = 1
  }

  # Amazon Linux 2, x86_64
  # 노드 그룹에 key-pair 설정
  ami_type       = "AL2_x86_64"
  instance_types = ["t3.large"]
  #capacity_type  = "ON_DEMAND"
  disk_size = 20

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
  ]
}