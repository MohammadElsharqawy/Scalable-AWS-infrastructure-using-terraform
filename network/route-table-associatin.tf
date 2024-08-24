resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public1.id

  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private1.id
}


resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private1.id
}
