# route attachment: wwl-hub-private route table to on_prem network
resource "aws_route" "hub_to_on_prem" {
  route_table_id         = var.hub_private_route_table_id
  destination_cidr_block = var.on_prem_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "hub_to_prod" {
  route_table_id         = var.hub_private_route_table_id
  destination_cidr_block = var.prod_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "hub_to_dev" {
  route_table_id         = var.hub_private_route_table_id
  destination_cidr_block = var.dev_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "hub_to_uat" {
  route_table_id         = var.hub_private_route_table_id
  destination_cidr_block = var.uat_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "hub_to_remote" {
  route_table_id         = var.hub_private_route_table_id
  destination_cidr_block = var.remote_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}
# resource "aws_subet" "private_app_1" defined in ../hub/terragrunt.hcl

resource "aws_subnet" "private_app_2" {
  vpc_id            = var.hub_vpc_id
  cidr_block        = "10.1.32.0/19"
  availability_zone = "us-east-1b"
  tags = {
    Name = "wwl-hub-private-app-2"
  }
}

resource "aws_route_table_association" "private_app_2" {
  subnet_id      = aws_subnet.private_app_2.id
  route_table_id = var.hub_private_route_table_id
}

resource "aws_subnet" "private_database_1" {
  vpc_id            = var.hub_vpc_id
  cidr_block        = "10.1.64.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "wwl-hub-private-database-1"
  }
}

resource "aws_route_table_association" "private_database_1" {
  subnet_id      = aws_subnet.private_database_1.id
  route_table_id = var.hub_private_route_table_id
}

resource "aws_subnet" "private_database_2" {
  vpc_id            = var.hub_vpc_id
  cidr_block        = "10.1.80.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "wwl-hub-private-database-2"
  }
}

resource "aws_route_table_association" "private_database_2" {
  subnet_id      = aws_subnet.private_database_2.id
  route_table_id = var.hub_private_route_table_id
}

resource "aws_subnet" "private_iis_1" {
  vpc_id            = var.hub_vpc_id
  cidr_block        = "10.1.96.0/19"
  availability_zone = "us-east-1a"
  tags = {
    Name = "wwl-hub-private-iis-1"
  }
}

resource "aws_route_table_association" "private_iis_1" {
  subnet_id      = aws_subnet.private_iis_1.id
  route_table_id = var.hub_private_route_table_id
}

resource "aws_subnet" "private_iis_2" {
  vpc_id            = var.hub_vpc_id
  cidr_block        = "10.1.128.0/19"
  availability_zone = "us-east-1b"
  tags = {
    Name = "wwl-hub-private-iis-2"
  }
}

resource "aws_route_table_association" "private_iis_2" {
  subnet_id      = aws_subnet.private_iis_2.id
  route_table_id = var.hub_private_route_table_id
}

resource "aws_subnet" "private_backup" {
  vpc_id            = var.hub_vpc_id
  cidr_block        = "10.1.160.0/19"
  availability_zone = "us-east-1c"
  tags = {
    Name = "wwl-hub-private-backup"
  }
}

resource "aws_route_table_association" "private_backup" {
  subnet_id      = aws_subnet.private_backup.id
  route_table_id = var.hub_private_route_table_id
}

resource "aws_subnet" "public_web_2" {
  vpc_id            = var.hub_vpc_id
  cidr_block        = "10.1.224.0/19"
  availability_zone = "us-east-1b"
  tags = {
    Name = "wwl-hub-public-web-2"
  }
}

resource "aws_route_table_association" "public_web_2" {
  subnet_id      = aws_subnet.public_web_2.id
  route_table_id = var.hub_public_route_table_id
}

# vpc attachment: db subnet group
resource "aws_db_subnet_group" "private_database_group" {
  name       = "wwl-hub-db-subnet-group"
  subnet_ids = [aws_subnet.private_database_1.id, aws_subnet.private_database_2.id]
}