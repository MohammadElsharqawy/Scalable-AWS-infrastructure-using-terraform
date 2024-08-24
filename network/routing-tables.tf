
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.myvpc.id
}


resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public.id

  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myigw.id

}



resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.myvpc.id
}


resource "aws_route" "private_route1" {
  route_table_id         = aws_route_table.private1.id

  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgate1.id
}


