# DB 서브넷 그룹
resource "aws_db_subnet_group" "db_subnet" {
  name       = "awesome-subnetgroup"
  subnet_ids = [aws_subnet.db_sub_a.id, aws_subnet.db_sub_c.id]

  tags = {
    Name = "awesome-subnetgroup"
  }
}

# DB 구성
resource "aws_db_instance" "db" {
  identifier_prefix      = "awesome-database"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  db_name                = "awesome"
  username               = "master"
  password               = "class1!!"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.db_security.id]

  tags = {
    Name = "awesome-db"
  }
}