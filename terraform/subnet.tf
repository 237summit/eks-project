resource "aws_subnet" "pub_sub_a" {
  vpc_id                  = aws_vpc.project-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true # public IP 자동 할당

  tags = {
    Name = "awesome-pub-sub-2a"
  }
}

resource "aws_subnet" "pub_sub_c" {
  vpc_id                  = aws_vpc.project-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = true # Public IP 자동 할당

  tags = {
    Name = "awesome-pub-sub-2c"
  }
}

# private subnet - mgnt
resource "aws_subnet" "mgnt_sub_a" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "awesome-mgnt-sub-2a"
  }
}

resource "aws_subnet" "mgnt_sub_c" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "awesome-mgnt-sub-2c"
  }
}

# node group subnet
resource "aws_subnet" "node_sub_a" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "awesome-node-sub-2a"
  }
}

resource "aws_subnet" "node_sub_c" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "awesome-node-sub-2c"
  }
}

# db subnet
resource "aws_subnet" "db_sub_a" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.13.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "awesome-db-sub-2a"
  }
}

resource "aws_subnet" "db_sub_c" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.23.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "awesome-db-sub-2c"
  }
}
