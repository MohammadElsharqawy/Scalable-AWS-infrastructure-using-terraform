
resource "aws_nat_gateway" "natgate1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public1.id

}

