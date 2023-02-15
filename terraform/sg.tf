# bastion security group
resource "aws_security_group" "bastion_security" {
  name        = "ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.project-vpc.id # 내가 생성한 VPC

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "awesome-bastion-sg"
  }
}

# jenkins security group
# jenkins 를 단독 ec2로 올리기 위해 별도 SG 생성
# jenkins port : 65535/tcp
resource "aws_security_group" "jenkins_security" {
  name        = "jenkins"
  description = "Allow ALL traffic"
  vpc_id      = aws_vpc.project-vpc.id # 내가 생성한 VPC

  ingress {
    description = "ALL traffic from VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "awesome-jenkins-sg"
  }
}


# db security group : 3306/tcp
resource "aws_security_group" "db_security" {
  name_prefix = "db"
  description = "Allow db inbound traffic"
  vpc_id      = aws_vpc.project-vpc.id # 내가 생성한 VPC

  ingress {
    description = "mysql from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_mysql_db"
  }
}