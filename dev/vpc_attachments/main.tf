# vpc attachment: private subnets
resource "aws_subnet" "private_app_2" {
  vpc_id            = var.dev_vpc_id
  cidr_block        = "10.2.32.0/19"
  availability_zone = "us-east-1b"
  tags = {
    Name = "wwl-dev-private-app-2"
  }
}

resource "aws_route_table_association" "private_app_2" {
  subnet_id      = aws_subnet.private_app_2.id
  route_table_id = var.dev_private_route_table_id
}

resource "aws_subnet" "private_database_1" {
  vpc_id            = var.dev_vpc_id
  cidr_block        = "10.2.64.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "wwl-dev-private-database-1"
  }
}

resource "aws_route_table_association" "private_database_1" {
  subnet_id      = aws_subnet.private_database_1.id
  route_table_id = var.dev_private_route_table_id
}

resource "aws_subnet" "private_database_2" {
  vpc_id            = var.dev_vpc_id
  cidr_block        = "10.2.80.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "wwl-dev-private-database-2"
  }
}

resource "aws_route_table_association" "private_database_2" {
  subnet_id      = aws_subnet.private_database_2.id
  route_table_id = var.dev_private_route_table_id
}

resource "aws_subnet" "private_iis_1" {
  vpc_id            = var.dev_vpc_id
  cidr_block        = "10.2.96.0/19"
  availability_zone = "us-east-1a"
  tags = {
    Name = "wwl-dev-private-private-iis-1"
  }
}

resource "aws_route_table_association" "private_iis_1" {
  subnet_id      = aws_subnet.private_iis_1.id
  route_table_id = var.dev_private_route_table_id
}

resource "aws_subnet" "private_iis_2" {
  vpc_id            = var.dev_vpc_id
  cidr_block        = "10.2.128.0/19"
  availability_zone = "us-east-1b"
  tags = {
    Name = "wwl-dev-private-private-iis-2"
  }
}

resource "aws_route_table_association" "private_iis_2" {
  subnet_id      = aws_subnet.private_iis_2.id
  route_table_id = var.dev_private_route_table_id
}

resource "aws_subnet" "private_backup" {
  vpc_id            = var.dev_vpc_id
  cidr_block        = "10.2.160.0/19"
  availability_zone = "us-east-1c"
  tags = {
    Name = "wwl-dev-private-backup"
  }
}

resource "aws_route_table_association" "private_backup" {
  subnet_id      = aws_subnet.private_backup.id
  route_table_id = var.dev_private_route_table_id
}

# vpc attachments: public subnets
resource "aws_subnet" "public_web_2" {
  vpc_id            = var.dev_vpc_id
  cidr_block        = "10.2.224.0/19"
  availability_zone = "us-east-1b"
  tags = {
    Name = "wwl-dev-public-web-2"
  }
}

resource "aws_route_table_association" "public_web_2" {
  subnet_id      = aws_subnet.public_web_2.id
  route_table_id = var.dev_public_route_table_id
}

# vpc attachment: db subnet group
resource "aws_db_subnet_group" "private_database_group" {
  name       = "wwl-dev-db-subnet-group"
  subnet_ids = [aws_subnet.private_database_1.id, aws_subnet.private_database_2.id]
}