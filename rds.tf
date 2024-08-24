# Generating random password
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


# Creating subnet groups
resource "aws_db_subnet_group" "mydb_subnet_group" {
  name = "mydb-subnet-group"
  subnet_ids = [
    module.network.private_subnet1_id,
    module.network.private_subnet2_id
  ]

  tags = {
    Name = "MyDB Private Subnet Group"
  }
}

# Creating rds
resource "aws_db_instance" "default" {
  allocated_storage                   = 10
  db_name                             = "mydb"
  engine                              = "mysql"
  engine_version                      = "5.7"
  instance_class                      = "db.t3.micro"
  identifier                          = "mydb"
  username                            = "master"
  password                            = random_password.password.result
  iam_database_authentication_enabled = true

  db_subnet_group_name   = aws_db_subnet_group.mydb_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg2_allow_3000_and_shh_from_vpc.id]
  skip_final_snapshot    = true
}