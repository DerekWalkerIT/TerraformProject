resource "aws_subnet" "remote_target_1" {
  vpc_id            = var.remote_vpc_id
  cidr_block        = "10.10.32.0/19"
  availability_zone = "us-east-1a"
  tags = {
    Name = "wwl-remote-1"
  }
}

resource "aws_route_table_association" "remote_target_1" {
  subnet_id      = aws_subnet.remote_target_1.id
  route_table_id = var.remote_secure_route_table_id
}

resource "aws_subnet" "remote_target_2" {
  vpc_id            = var.remote_vpc_id
  cidr_block        = "10.10.64.0/19"
  availability_zone = "us-east-1b"
  tags = {
    Name = "wwl-remote-2"
  }
}
resource "aws_route_table_association" "remote_target_2" {
  subnet_id      = aws_subnet.remote_target_2.id
  route_table_id = var.remote_secure_route_table_id
}
