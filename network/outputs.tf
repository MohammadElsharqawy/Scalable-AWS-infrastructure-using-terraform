output vpc_id{
    value = aws_vpc.myvpc.id
}

output public_subnet1_id{
    value = aws_subnet.public1.id
}

output public_subnet2_id{
    value = aws_subnet.public2.id
}

output private_subnet1_id{
    value = aws_subnet.private1.id
}

output private_subnet2_id{
    value = aws_subnet.private2.id
}

output vpc-cidr{
    value = aws_vpc.myvpc.cidr_block
}
