

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "public1"
  }
}


resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "public2"
  }
}


resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "private1"
  }
}


resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "private2"
  }
}