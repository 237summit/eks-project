# VPC 생성
# VPC network: 10.0.0.0/16
# VPC name : awssome-vpc - AWS에 만들어지는 VPC
# 테라폼 코드로 관리되는 VPC 블록이름 : vpc
#    aws_vpc = AWS에서 사용하는 vpc 만들겠다.
#    aws_resource-name
resource "aws_vpc" "project-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "awesome-vpc"
  }
}

# IGW 생성
resource "aws_internet_gateway" "project-igw" {
  vpc_id = resource.aws_vpc.project-vpc.id
  tags = {
    Name = "awesome-igw"
  }
}

# EIP 생성
resource "aws_eip" "project-bastion-eip" {
  instance = aws_instance.bastion.id
  vpc      = true

  tags = {
    Name = "awesome-bastion-eip"
  }
}

# NATGW 
resource "aws_eip" "project-nat-eip" {
  vpc = true

  tags = {
    Name = "awesome-nat-eip"
  }
}

# NAT 생성
resource "aws_nat_gateway" "project-nat" {
  allocation_id = aws_eip.project-nat-eip.id
  subnet_id     = aws_subnet.pub_sub_c.id

  tags = {
    Name = "awesome-nat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  # 이 NAT는 internet gw 만든 후에 생성되도록 한다.
  depends_on = [aws_internet_gateway.project-igw]
}


# Public rtb
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project-igw.id
  }

  tags = {
    Name = "awesome-pub-rt"
  }
}

# Private rtb
resource "aws_route_table" "pri_rt_a" {
  vpc_id = aws_vpc.project-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.project-nat.id
  }

  tags = {
    Name = " awecome-pri-rt-2a"
  }
  depends_on = [aws_nat_gateway.project-nat]
}

resource "aws_route_table" "pri_rt_c" {
  vpc_id = aws_vpc.project-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.project-nat.id
  }

  tags = {
    Name = " awecome-pri-rt-2c"
  }
  depends_on = [aws_nat_gateway.project-nat]
}

# rtb association
# Public subnet과 Routing Table 연결 = 서브넷연결
resource "aws_route_table_association" "pub_a" {
  subnet_id      = aws_subnet.pub_sub_a.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub_c" {
  subnet_id      = aws_subnet.pub_sub_c.id
  route_table_id = aws_route_table.pub_rt.id
}

# private subnet과 Routing Table 연결
# mgnt 서버를 위한 서브넷
resource "aws_route_table_association" "mgnt_sub_a" {
  subnet_id      = aws_subnet.mgnt_sub_a.id
  route_table_id = aws_route_table.pri_rt_a.id
}

resource "aws_route_table_association" "mgnt_sub_c" {
  subnet_id      = aws_subnet.mgnt_sub_c.id
  route_table_id = aws_route_table.pri_rt_c.id
}

# NodeGroup 서브넷
resource "aws_route_table_association" "node_sub_a" {
  subnet_id      = aws_subnet.node_sub_a.id
  route_table_id = aws_route_table.pri_rt_a.id
}

resource "aws_route_table_association" "node_sub_c" {
  subnet_id      = aws_subnet.node_sub_c.id
  route_table_id = aws_route_table.pri_rt_c.id
}

# DB 서브넷
resource "aws_route_table_association" "db_pri_a" {
  subnet_id      = aws_subnet.db_sub_a.id
  route_table_id = aws_route_table.pri_rt_a.id
}

resource "aws_route_table_association" "db_pri_c" {
  subnet_id      = aws_subnet.db_sub_c.id
  route_table_id = aws_route_table.pri_rt_c.id
}
