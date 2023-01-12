resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "nat2" {
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "ngw1" {
  allocation_id = aws_eip.nat1.id
  subnet_id = aws_subnet.public_us_east_2a.id
  tags = {
    Name = "NAT 1"
  }
}
resource "aws_nat_gateway" "ngw2" {
  allocation_id = aws_eip.nat2.id
  subnet_id = aws_subnet.public_us_east_2b.id
  tags = {
    Name = "NAT 2"
  }
}
